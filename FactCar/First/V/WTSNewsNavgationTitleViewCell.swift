//
//  WTSNewsNavgationTitleViewCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/7.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSNewsNavgationTitleViewCell: UICollectionViewCell {
  
  @IBOutlet weak var headLineBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
  
  @IBAction func headLineBtnClickEvent(_ sender: UIButton) {
    self.btnClickBlock()
  }

  typealias btnClick = () -> Void
  var btnClickBlock: btnClick!
  
}
