//
//  WTSHotSpotAdCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/22.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSHotSpotAdCell: UITableViewCell {
  
  @IBOutlet weak var cellAdImage: UIImageView!
  
  var adImgeData:WTSHSMDNewsData! {
    didSet {
      self.cellAdImage.sd_setImage(with: NSURL(string: self.adImgeData.title_pic1)! as URL, placeholderImage: UIImage(named: "focusnews_null_img3"))
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
