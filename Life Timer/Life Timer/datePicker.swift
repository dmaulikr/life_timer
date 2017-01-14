//
//  datePicker.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 1/13/17.
//  Copyright © 2017 kvanland. All rights reserved.
//

import UIKit

class datePicker: UIViewController {

    //MARK: Properties
    @IBOutlet weak var dateView: UIDatePicker!
    
    //Contstructor
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //Should set the minimum date for the date picker to the current date + 5 minutes
        dateView.minimumDate = Date().addingTimeInterval(300.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Should set the minimum date for the date picker to the current date + 5 minutes
        dateView.minimumDate = Date().addingTimeInterval(300.0)
    }


}
