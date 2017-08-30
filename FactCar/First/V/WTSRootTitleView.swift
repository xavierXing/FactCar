//
//  WTSRootTitleView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/28.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSRootTitleView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
  
  /// title
  let reuseIdentifierItemArray = ["HotSpotItem","VideoItem","LiveItem","BusinessItem","EvaluatingItem","ShoppingItem","NewCarItem","UseCarItem","CaltureItem","TravelItem","TechnologyItem","MarketItem"]
  
  var selecting:[String:Any]! = ["index":0]
  
  typealias clickIndex = (_ index:Int)->()
  var clickIndexBlock:clickIndex!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    super.delegate = self
    super.dataSource = self
    print("\(self.contentSize)")
    
  }
  

}

extension WTSRootTitleView {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 12
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierItemArray[indexPath.row], for: indexPath)
    
    (cell.viewWithTag(indexPath.row + 1000) as? UILabel)?.font = UIFont.systemFont(ofSize: CGFloat((selecting["index"] as! Int == indexPath.row) ? 15 : 14), weight: CGFloat((selecting["index"] as! Int == indexPath.row) ? 1 : 0))
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selecting = ["index":indexPath.row]
    for i in 0..<reuseIdentifierItemArray.count {
      let cell = collectionView.cellForItem(at: IndexPath(row: i, section: 0))
      let fontSize = (cell?.isSelected ?? false) ? 15 : 14
      let fontWeight = (cell?.isSelected ?? false) ? 1 : 0
      (cell?.viewWithTag(i + 1000) as? UILabel)?.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: CGFloat(fontWeight))
    }
    collectionView.reloadData()
    self.clickIndexBlock(indexPath.row)
    
    var x: Int?
    switch indexPath.row {
    case 5: x = 0;   self.setContentOffset(CGPoint(x: x!, y: 0), animated: true); break
    case 6: x = (480 - Int(self.swiftWidth())); self.setContentOffset(CGPoint(x: x!, y: 0), animated: true); break
    default:  break
    }
    
  }
  
}

extension WTSRootTitleView {
    public func autoIndex(index:Int) -> () {
    self.collectionView(self, didSelectItemAt: IndexPath(row: index, section: 0))
  }
}

