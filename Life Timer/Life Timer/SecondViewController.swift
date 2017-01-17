//
//  SecondViewController.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 12/16/16.
//  Copyright © 2016 kvanland. All rights reserved.
//

import UIKit
import GoogleSignIn

class SecondViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource,GIDSignInUIDelegate{

    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    // Data model: These strings will be the data for the table view cells
    //let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    // cell reuse id (cells that scroll out of view can be reused)
   // let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets up the google delegate
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Register the table view cell class and its reuse id
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableViewDelegate
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   // return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        //let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        //cell.textLabel?.text = self.animals[indexPath.row]
        
        //return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
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
