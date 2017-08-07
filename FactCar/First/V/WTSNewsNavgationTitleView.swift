//
//  WTSNewsNavgationTitleView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/7.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSNewsNavgationTitleView: UIView ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
  let cellTag: String = "titleCellview"
  let collectionCellWidth: CGFloat = swiftScaleWidth_iPhone6(num: 40)
    //#MARK: - Override -
    override init(frame: CGRect) {
        super.init(frame: frame)
      self.settingTitleViewNavgation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    //#MARK: - Event -
    
    //#MARK: - CallBack -
    
    //#MARK: - Lazy Loading Model -
  
    //#MARK: - Lazy Loading View -
  lazy var collectionTitleView: UICollectionView = {
    let collectionLayout = UICollectionViewFlowLayout()
    collectionLayout.scrollDirection = .horizontal
    let collectionTitleView: UICollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: collectionLayout)
    collectionTitleView.delegate = self
    collectionTitleView.dataSource = self
    collectionTitleView.backgroundColor = UIColor.red
    collectionTitleView.contentSize = CGSize(width: self.collectionCellWidth * 12, height: 30)
    collectionTitleView.showsHorizontalScrollIndicator = false
    return collectionTitleView
  }()
  
  //#MARK: - Lazy Loading Model -
  lazy var titleArray: NSArray = {
    var titleArray: NSArray = NSArray()
    titleArray = ["热点", "视频", "直播", "行业", "评测", "导购", "新车",
                   "用车", "文化", "游记", "技术", "行情"];
    return titleArray
  }()
}

//#MARK: - Public Method -
extension WTSNewsNavgationTitleView {
    
}

//#MARK: - Private Method -
extension WTSNewsNavgationTitleView {
  fileprivate func settingTitleViewNavgation() -> Void {
    self.addSubview(self.collectionTitleView)
    self.collectionTitleView.register(UINib.init(nibName: "WTSNewsNavgationTitleViewCell", bundle: nil), forCellWithReuseIdentifier: cellTag)
  }
}

//#MARK: - Delegate -
extension WTSNewsNavgationTitleView {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return self.titleArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTag, for: indexPath)
    let cellButton: UIButton = cell.viewWithTag(1) as! UIButton
    cellButton.setTitle(self.titleArray[indexPath.section] as? String, for: .normal)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionCellWidth, height: 30)
  }
  
  
}

//#MARK: - Event -
extension WTSNewsNavgationTitleView {
    
}

//#MARK: - CallBack -
extension WTSNewsNavgationTitleView {
    
}

