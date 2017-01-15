//
//  SIgnInControllerViewController.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 1/14/17.
//  Copyright © 2017 kvanland. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseGoogleAuthUI

class SIgnInControllerViewController: UIViewController, GIDSignInUIDelegate{
    
    //MARK: Properties
    @IBOutlet weak var signOutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Shows the Google sign in button
        GIDSignIn.sharedInstance().uiDelegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
    }
    


}
