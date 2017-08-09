//
//  WTSFactCarRefreshGifHeader.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSFactCarRefreshGifHeader: MJRefreshGifHeader {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.settingGif()
    self.configuration()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var refreshImgs: NSMutableArray = {
    let refreshImgs: NSMutableArray = NSMutableArray()
    return refreshImgs
  }()
  
  lazy var normalImgs: NSMutableArray = {
    let normalImgs: NSMutableArray = NSMutableArray()
    let img: UIImage = UIImage(named: "wts_loading_img1")!
    normalImgs.add(img)
    return normalImgs
  }()
  
}

extension WTSFactCarRefreshGifHeader {
  fileprivate func settingGif() -> Void {
    for i in 1..<13 {
      let img: UIImage = UIImage(named: "wts_loading_img" + String(i))!
      self.refreshImgs.add(img)
    }
  }
  
  fileprivate func configuration() -> Void {
    self.setImages(refreshImgs as! [Any], for: .refreshing)
    self.setImages(normalImgs as! [Any], for: .idle)
    self.setImages(refreshImgs as! [Any], for: .pulling)
    self.lastUpdatedTimeLabel.isHidden = true
    self.stateLabel.isHidden = true
    
  }
  
}
