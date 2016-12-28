//
//  RatingControl.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 12/27/16.
//  Copyright © 2016 kvanland. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setUpButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet{
            setUpButtons()
        }
    }
    
    private var ratingButtons = [UIButton]()
    
    var rating = 0
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        print("Button pressed")
    }
    
    //MARK: Private Methods
    private func setUpButtons(){
        
        //Clear any exising buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //Create buttons
        for _ in 0..<starCount {
            
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //Constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //Setup button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //Add button to the stack
            addArrangedSubview(button)
            
            //Add button to the button array
            ratingButtons.append(button)
        }
    }
}
