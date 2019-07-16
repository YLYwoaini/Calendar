//
//  YLYMonthReusableView.swift
//  Calendar
//
//  Created by mac on 2019/7/15.
//  Copyright © 2019 YLY. All rights reserved.
//

import UIKit

class YLYMonthReusableView: UICollectionReusableView {
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.cyan
        label = UILabel(frame: CGRect(origin: .zero, size: frame.size))
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
