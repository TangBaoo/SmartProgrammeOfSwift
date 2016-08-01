//
//  SecTableViewCell.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/25.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class SecTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {

    var collectionView: UICollectionView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        
        // 滑动方向
        collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.itemSize = CGSizeMake(50, 50)
        collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        self.collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: collectionViewFlowLayout)
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource  = self
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.bounces = false
        self.contentView.addSubview(self.collectionView!)
        
        self.collectionView!.registerClass(SecCollectionViewCell.self, forCellWithReuseIdentifier: "ReuseIdentifier")
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ReuseIdentifier", forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor(red: CGFloat(random())/CGFloat(RAND_MAX), green: CGFloat(random())/CGFloat(RAND_MAX), blue: CGFloat(random())/CGFloat(RAND_MAX), alpha: 1)
        
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
