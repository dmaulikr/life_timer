//
//  SecondViewController.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 12/16/16.
//  Copyright © 2016 kvanland. All rights reserved.
//

import UIKit
import GoogleSignIn

class SecondViewController: UIViewController, GIDSignInUIDelegate{

    //MARK: Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets up the google delegate
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Actions
    
    //When the user chooses to add another timer to the list of timers
    @IBAction func AddTimerButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        
        GIDSignIn.sharedInstance().signOut()
        let vc: AnyObject! = storyboard?.instantiateViewController(withIdentifier: "loginController")
        present(vc as! SIgnInControllerViewController, animated: true, completion: nil)
        
    }
    
}
