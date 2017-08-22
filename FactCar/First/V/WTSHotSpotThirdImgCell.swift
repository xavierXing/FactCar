//
//  WTSHotSpotThirdImgCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/21.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSHotSpotThirdImgCell: UITableViewCell {
  
  /// 第一张图
  @IBOutlet weak var cellHeaderFirstImage: UIImageView!
  /// 第二张图
  @IBOutlet weak var cellHeaderSecondImage: UIImageView!
  /// 第三张图
  @IBOutlet weak var cellHeaderThirdImage: UIImageView!
  
  /// 头图高度
  @IBOutlet weak var headerHeight: NSLayoutConstraint!
  /// 头图宽度
  @IBOutlet weak var headerWidth: NSLayoutConstraint!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  override func updateConstraints() {
    super.updateConstraints()
    self.headerHeight.constant = ((XHScreenW - XHScreenW * 0.03) * 2) / 9
    self.headerWidth.constant = (XHScreenW - 30) / 3.0
  }
  
}
