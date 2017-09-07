//
//  SearchStoryCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/7.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class SearchStoryCell: UITableViewCell {
  
  var searchStoryParameter: SearchStoryParameter? {
    didSet {
      self.headerImage.sd_setImage(with: URL(string: (self.searchStoryParameter?.title_pic1)!))
      self.titleLabel.text = self.searchStoryParameter?.title
      self.authorLabel.text = self.searchStoryParameter?.author
      self.timeLabel.text = self.searchStoryParameter?.story_date
    }
  }
  
  @IBOutlet weak var headerImage: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var authorLabel: UILabel!
  
  @IBOutlet weak var timeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
