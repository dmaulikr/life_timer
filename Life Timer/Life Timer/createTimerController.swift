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
    
    
    //Mark: Actions
    
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
        //TODO: Create the timer possibly NSTimer and then create a tableView item to display the timer within the second view controller
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        //TODO: Programmatically show the second view controller view and discard all information collected about this particular timer
    }
    
    
}
