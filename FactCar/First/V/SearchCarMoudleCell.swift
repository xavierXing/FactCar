//
//  SearchCarMoudleCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/8.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class SearchCarMoudleCell: UITableViewCell {
  
  @IBOutlet weak var headerImage: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var priceLabel: UILabel!
  
  var bseries:Bseries? {
    didSet {
      self.headerImage.sd_setImage(with: URL(string: (self.bseries?.cspic)!), placeholderImage: UIImage(named: "focusnews_null_img3"))
      self.titleLabel.text = self.bseries?.showname
      self.priceLabel.text = (self.bseries?.minprice == "0" || self.bseries?.minprice == "0.00") ? "暂无报价" : "参考底价: " + (self.bseries?.minprice)! + "~" + (self.bseries?.maxprice)! + "万"
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

  }

}
