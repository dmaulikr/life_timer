//
//  FirstViewController.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 12/16/16.
//  Copyright © 2016 kvanland. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var timerNameTextField: UITextField!
    @IBOutlet weak var timerNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    //Constructor
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handles the text field's user input through delegate callbacks.
        timerNameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        timerNameLabel.text = timerNameTextField.text
    }
    
    
    
    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        timerNameLabel.text = "Default Text"
    }
    
    
    
    
    
}

