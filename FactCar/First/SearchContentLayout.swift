//
//  SearchContentLayout.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/6.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class SearchContentLayout: UICollectionViewFlowLayout {

  override func prepare() {
    super.prepare()
    self.scrollDirection = .horizontal
    self.minimumLineSpacing = 0
    self.minimumInteritemSpacing = 0
    self.itemSize = CGSize(width: XHScreenW, height: XHScreenH - 30 - 64)
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}
