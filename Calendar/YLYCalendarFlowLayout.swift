//
//  YLYCalendarFlowLayout.swift
//  Calendar
//
//  Created by mac on 2019/7/15.
//  Copyright © 2019 YLY. All rights reserved.
//

import UIKit

class YLYCalendarFlowLayout: UICollectionViewFlowLayout {
    var getDateClosure: ((IndexPath) -> YLYDateModel)?
    
    var height: CGFloat = 0
    var attributes: [UICollectionViewLayoutAttributes] = []
    var attributes_header: [UICollectionViewLayoutAttributes] = []
    let headerHeight: CGFloat = 30
    let itemHeight: CGFloat = UIScreen.main.bounds.width / 7.0
    
    override func prepare() {
        super.prepare()
        
        attributes.removeAll()
        attributes_header.removeAll()
        height = 0
        
        headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: headerHeight)
        
        let sections: Int = (collectionView?.dataSource?.numberOfSections!(in: collectionView!))!
        
        for section in 0..<sections {
            let rowsCount = collectionView?.dataSource?.collectionView(collectionView!, numberOfItemsInSection: section)
            let attr = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, with: IndexPath(row: 0, section: section))
            attr.frame = CGRect(x: 0, y: height, width: (collectionView?.frame.width)!, height: headerHeight)
            attributes.append(attr)
            attributes_header.append(attr)
            height += headerHeight
            for row in 0..<rowsCount! {
                let indexPath = IndexPath(row: row, section: section)
                self.attributes.append(layoutAttributesForItem(at: indexPath)!)
            }
            height += itemHeight
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let day = self.getDateClosure!(indexPath)
        let x = CGFloat(day.weekday) * itemHeight
        if day.day != 1 && day.weekday % 7 == 0 {
            height += itemHeight
        }
        attribute.frame = CGRect(x: x, y: height, width: itemHeight, height: itemHeight)
        return attribute
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributes
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attributes_header[indexPath.section]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: (collectionView?.bounds.width)!, height: height)
    }
    
    deinit {
        print("deinit ----- \(self)")
    }
}
