//
//  RootCollectionLayout.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/28.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class RootCollectionLayout: UICollectionViewFlowLayout {
  
  override func prepare() {
    super.prepare()
    self.scrollDirection = .horizontal
    self.minimumLineSpacing = 0
    self.minimumInteritemSpacing = 0
    self.itemSize = CGSize(width: XHScreenW, height: XHScreenH - 113)
    
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
}
