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

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        
        
        //TODO(developer) customize look and feel of button
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


}
