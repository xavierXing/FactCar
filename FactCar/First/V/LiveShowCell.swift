//
//  LiveShowCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/11.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class LiveShowCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var headerImage: UIImageView!
  
  @IBOutlet weak var liveShowTypeImage: UIImageView!
  
  @IBOutlet weak var liveAuthorLabel: UILabel!
  
  @IBOutlet weak var audienceCountLabel: UILabel!

  @IBOutlet weak var sourceLabel: UILabel!
  
  var liveList:WTSLVideoList? {
    didSet{
      self.titleLabel.text = self.liveList?.title
      self.headerImage.sd_setImage(with: URL(string: (self.liveList?.title_pic)!), placeholderImage: UIImage(named: "focusnews_null_img3"))
      self.liveAuthorLabel.text = "主播: " + (self.liveList?.anchor)!
      self.audienceCountLabel.text = self.liveList?.base_count == nil ? "" : (self.liveList?.base_count)! + "人观看"
      self.sourceLabel.layer.borderColor = UIColor.red.cgColor
      self.liveShowTypeImage.image = UIImage(named: (self.liveList?.status)!)
      
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
