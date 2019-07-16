//
//  YLYDateModel.swift
//  Calendar
//
//  Created by mac on 2019/7/15.
//  Copyright © 2019 YLY. All rights reserved.
//

import UIKit

class YLYDateModel: NSObject {
    var year: Int
    var month: Int
    var day: Int
    var weekday: Int

    init(dateComponents: DateComponents) {
        year = dateComponents.year!
        month = dateComponents.month!
        day = dateComponents.day!
        weekday = dateComponents.weekday! - 1
        super.init()
    }
    
    override var description: String {
        return "year:\(year) month:\(month) day:\(day) weekday:\(weekday)"
    }
}
