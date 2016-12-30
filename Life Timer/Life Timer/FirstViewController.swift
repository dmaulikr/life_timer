//
//  FirstViewController.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 12/16/16.
//  Copyright © 2016 kvanland. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
    
    
    //MARK: UIImagePickerControllerDelegate
    
    //When the user cancels choosing a photo
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    //When the user selects a photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //The info directory may contain multiple representations of the image but we want to use the original 
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
        UIImage else{
            fatalError("Expected a dictionary containing an image, but was provided he following: \(info)")
        }
        
        //Sets photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        //Dismiss picker
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: Actions
    
    @IBAction func selecteImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide keyboard
        timerNameTextField.resignFirstResponder()
        
        //UIImagePickerController is a view controller that lets the user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        //Makes sure the ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        timerNameLabel.text = "Default Text"
    }
    
    
    
    
    
}

