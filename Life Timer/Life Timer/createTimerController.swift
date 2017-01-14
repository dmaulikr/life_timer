//
//  createTimerController.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 12/30/16.
//  Copyright © 2016 kvanland. All rights reserved.
//

import UIKit

class createTimerController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    //MARK: Properties
    @IBOutlet weak var timerNameTextField: UITextField!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var countdownView: UIView!
    @IBOutlet weak var colorPicker: UIPickerView!
    let colorPickerData = ["Black", "Dark Gray", "Gray", "Light Gray", "Brown", "Red", "Orange", "Yellow", "Green", "Cyan", "Blue", "Magenta", "Purple", "White"]
    var timer: Timer!
    var counter = 0
    var time: Int = 0
    private var datePickerEmbedded: datePickerController!
    private var countdownPickerEmbedded: countdownPickerController!
    
    //Constructor
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerNameTextField.delegate = self
        
        //Default look of the create a timer page 
        dateView.isHidden = false
        countdownView.isHidden = true
        
        //Sets the colorpicker for timer color
        colorPicker.delegate = self
        colorPicker.dataSource = self
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIPickerViewDelegate

    //Allows the pickerView populate the components with the correct names
    func pickerView(_ UIPickerView: UIPickerView, titleForRow: Int, forComponent: Int) -> String?{
        return colorPickerData[titleForRow]
    }
    
    //MARK: UIPickerDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorPickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK: UITextFieldDelegate
    
    //When the user presses the "return"/"done" button on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide the keyboard
        timerNameTextField.resignFirstResponder()
        return true //Returns whether the system should process the press of the "return" key
    }
    
    //When the textfield resigns its FirstResponder status
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    //MARK: Timer
    
    //Allows us to gain a reference to the UIDatePickers in the embedded UIViews
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? datePickerController, segue.identifier == "datePickerSegue"{
            self.datePickerEmbedded = vc
        }else if let vc = segue.destination as? countdownPickerController, segue.identifier == "countdownPickerSegue"{
            self.countdownPickerEmbedded = vc
        }
    }
    
    //Calculates the countdown for the timer (selector for the timer)
    func calculateCountdown(){
            counter += 1
            print(counter)
        if counter == time{
            timer.invalidate()
        }
    }
    
    //Calculate the number of seconds needed for the when the user picks a date and time to count toward
    func calculateDate(){
        let date = datePickerEmbedded.dateView.date;
        let currentDate = Date()
        let difference = date .timeIntervalSince(currentDate)
        time = Int(difference)
        print(time)
    }
    
    //MARK: Actions
    
    //Allows the user to choose the type of timer they want to make date/time or countdown
    @IBAction func timerChoice(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            dateView.isHidden = false
            countdownView.isHidden = true
            break;
        case 1:
            dateView.isHidden = true
            countdownView.isHidden = false
            break;
        default:
            break;
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        //TODO check if all parameters are met ie the name time and color selected
        if(dateView.isHidden){
            time = Int(countdownPickerEmbedded.countDownPicker.countDownDuration)
            print(time)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(createTimerController.calculateCountdown), userInfo: nil, repeats: true)
        }else if(countdownView.isHidden){
            calculateDate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(createTimerController.calculateCountdown), userInfo:nil, repeats: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        //Goes back to previous viewController without saving any data
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK Custom date picker view controller
class datePickerController: UIViewController{
    
    @IBOutlet weak var dateView: UIDatePicker!
    
    let secondsInADay: Double = 86400.00
    
    //Contstructor
    override func viewDidLoad(){
        super.viewDidLoad()
        setDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDefault()
    }
    
    func setDefault(){
        dateView.setDate(Date().addingTimeInterval(secondsInADay), animated: true)
        //Should set the minimum date for the date picker to tomorrow at the same time
        dateView.minimumDate = Date().addingTimeInterval(secondsInADay)
    }
}

//MARK: Custom count down controller
class countdownPickerController: UIViewController{
    
    @IBOutlet weak var countDownPicker: UIDatePicker!
    
    //Constructor
    override func viewDidLoad(){
        super.viewDidLoad()
        setDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDefault()
    }
    
    func setDefault(){
        //Should set the starting countdown time to 1 minute
        countDownPicker.countDownDuration = 1;
    }
    
    
}
