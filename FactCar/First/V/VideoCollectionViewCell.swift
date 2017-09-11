//
//  VideoCollectionViewCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/11.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
  
  
  @IBOutlet weak var headerImage: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  var config:WTSVMDConfig? {
    didSet {
      self.titleLabel.text = self.config?.name
    }
  }
  
  override func awakeFromNib() {
    
  }
}
