//
//  ViewController.swift
//  Calendar
//
//  Created by mac on 2019/7/15.
//  Copyright © 2019 YLY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    lazy var list: NSArray = {
        return CalendarDataSource.getMouth()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = YLYCalendarFlowLayout()
        layout.getDateClosure = {
            [weak self]
            (indexPath: IndexPath) -> YLYDateModel in
            let days = self?.list[indexPath.section] as! NSArray
            let day = days[indexPath.row] as! YLYDateModel
            return day
        }
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.yellow
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(YLYDayItem.self, forCellWithReuseIdentifier: "YLYDayItem")
        collectionView.register(YLYMonthReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "YLYMonthReusableView")
        view.addSubview(collectionView)
    }
    
    deinit {
        print("deinit ----- \(self)")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let days = list[section] as! NSArray
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let days = list[indexPath.section] as! NSArray
        let day = days[indexPath.row] as! YLYDateModel
        
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "YLYDayItem", for: indexPath) as! YLYDayItem
        item.label.text = "\(day.day)"
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview: UICollectionReusableView!
        if kind == UICollectionView.elementKindSectionHeader {
            let days = list[indexPath.section] as! NSArray
            let day = days[indexPath.row] as! YLYDateModel
            
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "YLYMonthReusableView", for: indexPath)
            (reusableview as! YLYMonthReusableView).label.text = "\(day.year).\(day.month).\(day.month)"
        }
        return reusableview
    }
}

