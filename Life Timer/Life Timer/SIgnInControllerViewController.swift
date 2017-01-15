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
        //Attempts to sign in silently
        GIDSignIn.sharedInstance().signInSilently()
        checkSignedIn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       checkSignedIn()
    }
    
    func checkSignedIn(){
        print("Checked in Signed In")
        if GIDSignIn.sharedInstance().currentUser != nil{
            print("currentUser signed in")
        }
        
        if GIDSignIn.sharedInstance().clientID != nil{
            print("Confirmed that user is signed in clientID")
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
    
    //User signs out 
    @IBAction func signOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
    }
    


}
