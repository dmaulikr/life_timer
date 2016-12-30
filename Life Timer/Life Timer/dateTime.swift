//
//  dateTime.swift
//  Life Timer
//
//  Created by Kyle Van Landingham on 12/30/16.
//  Copyright © 2016 kvanland. All rights reserved.
//

import Foundation

class dateTime{
    
    //MARK: Variables
    private var year: Int
    private var month: Int
    private var day: Int
    private var hour: Int
    private var min: Int
    
    init(year: Int, month: Int, day: Int, hour: Int, min: Int) {
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.min = min
    }
    
    //MARK: Setters
    func alterData(year: Int, month: Int, day: Int, hour: Int, min: Int){
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.min = min
    }

    //MARK: Getters
    func getYear() -> Int{
        return year
    }
    
    func getMonth() -> Int{
        return month
    }
    
    func getDay() -> Int{
        return day
    }
    
    func getHour() -> Int{
        return hour
    }
    
    func getMin() -> Int{
        return min
    }
    
    
    
}
