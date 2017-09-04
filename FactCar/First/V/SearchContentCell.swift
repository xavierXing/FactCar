//
//  SearchContentCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/4.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class SearchContentCell: UITableViewCell {
  
  
  @IBOutlet weak var cellHeadImage: UIImageView!
  @IBOutlet weak var cellTitleLabel: UILabel!
  @IBOutlet weak var cellAuthorLabel: UILabel!
  @IBOutlet weak var cellTimeLabel: UILabel!
  
  var story: Story! {
    didSet {
      self.cellHeadImage.sd_setImage(with: URL(string: self.story.title_pic2))
      self.cellTitleLabel.text = self.story.title
      self.cellAuthorLabel.text = self.story.source
      self.cellTimeLabel.text = self.story.story_date
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

  }

}
