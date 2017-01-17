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

        //Sets up the google delegate
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkSignedIn()
    }
    
    func checkSignedIn(){
        if GIDSignIn.sharedInstance().hasAuthInKeychain(){
            //If the user has previously been authenitcated by google then sign them in silently
            GIDSignIn.sharedInstance().signInSilently()
            let vc: AnyObject! = storyboard?.instantiateViewController(withIdentifier: "tabBarController")
            present(vc as! UITabBarController, animated: true, completion: nil)
        }
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
           
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    //MARK: Actions
    
    


}
