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
  /// 标题
  @IBOutlet weak var cellTitleLabel: UILabel!
  /// 作者
  @IBOutlet weak var cellAuthorLabel: UILabel!
  /// 时间
  @IBOutlet weak var cellTimeLabel: UILabel!
  
  /// 头图高度
  @IBOutlet weak var headerHeight: NSLayoutConstraint!
  /// 头图宽度
  @IBOutlet weak var headerWidth: NSLayoutConstraint!
  
  var thirdImgData: NSArray! {
    didSet {
      
      self.cellHeaderFirstImage.sd_setImage(with: NSURL(string: self.thirdImgData[0] as! String) as URL?, placeholderImage: UIImage(named: ""))
      
      self.cellHeaderSecondImage.sd_setImage(with: NSURL(string: self.thirdImgData[1] as! String) as URL?, placeholderImage: UIImage(named: ""))
      
      self.cellHeaderThirdImage.sd_setImage(with: NSURL(string: self.thirdImgData[2] as! String) as URL?, placeholderImage: UIImage(named: ""))
      
    }
  }
  
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
