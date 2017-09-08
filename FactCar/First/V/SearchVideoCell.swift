//
//  SearchVideoCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/8.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class SearchVideoCell: UITableViewCell {
  
  @IBOutlet weak var headerImage: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var playCountLabel: UILabel!
  
  @IBOutlet weak var authorLabel: UILabel!
  
  @IBOutlet weak var playTimeLabel: UILabel!
  
  var video:Video? {
    didSet {
      self.headerImage.sd_setImage(with: URL(string: (self.video?.title_pic1)!), placeholderImage: UIImage(named: ""))
      self.titleLabel.text = self.video?.title
      self.playCountLabel.text = self.video?.base_count
      self.playTimeLabel.text = self.video?.time
      self.authorLabel.text = self.video?.vedio_type
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
