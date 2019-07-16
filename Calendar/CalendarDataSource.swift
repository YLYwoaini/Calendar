//
//  CalendarDataSource.swift
//  Calendar
//
//  Created by mac on 2019/7/15.
//  Copyright © 2019 YLY. All rights reserved.
//

import UIKit

class CalendarDataSource: NSObject {
    static func getMouth(count: Int = 100) -> NSArray {
        let calendar = Calendar(identifier: .gregorian)
        var components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute], from: Date())
        components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute], from: calendar.date(byAdding: .day, value: 1 - components.day!, to: Date())!)
        let dataSource = NSMutableArray()
        
        var date = calendar.date(from: components)
        for _ in 1 ... count {
            let mouth = NSMutableArray()
            dataSource.add(mouth)
            
            let range = calendar.range(of: .day, in: .month, for: date!)
            let dayCount = range!.upperBound - 1
            
            for _ in 1 ... dayCount {
                let dayModel = YLYDateModel(dateComponents: components)
                mouth.add(dayModel);
                
                date = calendar.date(byAdding: .day, value: 1, to: date!)
                components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute], from: date!)
            }
        }
        
        return dataSource
    }
}
