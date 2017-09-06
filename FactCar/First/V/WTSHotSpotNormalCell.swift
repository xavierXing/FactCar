//
//  WTSHotSpotNormalCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/21.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSHotSpotNormalCell: UITableViewCell {
  ///cell头图
  @IBOutlet weak var cellHeaderImage: UIImageView!
  ///cell标题label
  @IBOutlet weak var cellTitleLabel: UILabel!
  ///cell作者label
  @IBOutlet weak var cellAuthorLabel: UILabel!
  ///cell时间label
  @IBOutlet weak var cellTimeLabel: UILabel!
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.backgroundColor = UIColor.white
    
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  override func updateConstraints() {
    super.updateConstraints()
    
  }

}
