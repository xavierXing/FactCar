//
//  VideoPlayCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/11.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class VideoPlayCell: UITableViewCell {
  
  @IBOutlet weak var headerImage: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var timeLabel: UILabel!
  
  @IBOutlet weak var playTimeLabel: UILabel!
  
  var videoList:WTSVMDVideoList? {
    didSet {
      self.headerImage.sd_setImage(with: URL(string: (self.videoList?.title_pic1)!), placeholderImage: UIImage(named: "focusnews_null_img3"))
      self.titleLabel.text = self.videoList?.title!
      self.timeLabel.text = self.videoList?.publish_time!
      self.playTimeLabel.text = self.videoList?.time!
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

  }

}
