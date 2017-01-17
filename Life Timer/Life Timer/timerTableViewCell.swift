//
//  timerTableViewCell.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 1/16/17.
//  Copyright © 2017 kvanland. All rights reserved.
//

import UIKit

class timerTableViewCell: UITableViewCell {

    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var timerNameLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
