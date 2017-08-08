//
//  WTSNewsNavgationTitleView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/7.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSNewsNavgationTitleView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  typealias cellBtn = (_ tag: CGFloat)->Void
  var cellBtnBlock: cellBtn!
  
  let cellTag: String = "titleCellview"
  let collectionCellWidth: CGFloat = swiftScaleWidth_iPhone6(num: 40)
  // #MARK: - Override -
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
  // #MARK: - Event -
  
  // #MARK: - CallBack -
  
  // #MARK: - Lazy Loading Model -
  
  // #MARK: - Lazy Loading View -
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
  
  // #MARK: - Lazy Loading Model -
  lazy var titleArray: NSArray = {
    var titleArray: NSArray = NSArray()
    titleArray = ["热点", "视频", "直播", "行业", "评测", "导购", "新车",
                  "用车", "文化", "游记", "技术", "行情"]
    return titleArray
  }()
}

// #MARK: - Public Method -
extension WTSNewsNavgationTitleView {

  public func settingCollectionViewBtn(index: CGFloat) -> Void {
    for cell in self.collectionTitleView.visibleCells {
      let Btn:UIButton = cell.viewWithTag(1) as! UIButton
      if (cell.tag - 1000) == Int(index) {
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: 1)
      } else {
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: 0)
      }
    }
  }
}

// #MARK: - Private Method -
extension WTSNewsNavgationTitleView {
  fileprivate func settingTitleViewNavgation() {
    self.addSubview(self.collectionTitleView)
    self.collectionTitleView.register(UINib(nibName: "WTSNewsNavgationTitleViewCell", bundle: nil), forCellWithReuseIdentifier: cellTag)
  }
}

// #MARK: - Delegate -
extension WTSNewsNavgationTitleView {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return self.titleArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: WTSNewsNavgationTitleViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTag, for: indexPath) as! WTSNewsNavgationTitleViewCell
    let cellButton: UIButton = cell.viewWithTag(1) as! UIButton
    cellButton.setTitle(self.titleArray[indexPath.section] as? String, for: .normal)
    cell.btnClickBlock = {
      for i in 0..<collectionView.visibleCells.count {
        let subCell: WTSNewsNavgationTitleViewCell = collectionView.visibleCells[i] as! WTSNewsNavgationTitleViewCell
        let subBtn: UIButton = subCell.viewWithTag(1) as! UIButton
        /// 选中
        if cell.tag == subCell.tag {
          subBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: 1)
          self.cellBtnBlock(CGFloat(subCell.tag))
        } else {
          subBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: 0)
        }
      }
      
    }
    cell.tag = indexPath.section + 1000
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionCellWidth, height: 30)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
  
}

// #MARK: - Event -
extension WTSNewsNavgationTitleView {
  
}

// #MARK: - CallBack -
extension WTSNewsNavgationTitleView {
  
}

