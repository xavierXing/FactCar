//
//  WTSFourButtonCell.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/21.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSFourButtonCell: UITableViewCell {
  /// 第一个btn
  @IBOutlet weak var cellFirstButton: UIButton!
  /// 第二个btn
  @IBOutlet weak var cellSecondButton: UIButton!
  /// 第三个btn
  @IBOutlet weak var cellThirdButton: UIButton!
  /// 第四个btn
  @IBOutlet weak var cellFourthButton: UIButton!
  
  @IBOutlet weak var cellFirstLabel: UILabel!
  
  @IBOutlet weak var cellSecondLabel: UILabel!
  
  @IBOutlet weak var cellThirdLabel: UILabel!
  
  @IBOutlet weak var cellFourLabel: UILabel!
  
  
  @IBOutlet weak var buttonWidth: NSLayoutConstraint!
  
  @IBOutlet weak var buttonHeight: NSLayoutConstraint!
  
  @IBOutlet weak var cellFirstLeading: NSLayoutConstraint!
  
  @IBOutlet weak var cellSecondLeading: NSLayoutConstraint!
  
  @IBOutlet weak var cellThirdLeading: NSLayoutConstraint!
  
  var fourBtnData:[WTSHSMDFourBtn]! {
    didSet {

      self.cellFirstButton.sd_setBackgroundImage(with: NSURL(string: (self.fourBtnData[0] as WTSHSMDFourBtn).title_pic)! as URL, for: .normal, placeholderImage: UIImage(named: "wts_loading_img1"))
      
      self.cellFirstLabel.text = (self.fourBtnData[0] as WTSHSMDFourBtn).name
      
      let gif:FLAnimatedImageView = FLAnimatedImageView(frame: self.cellSecondButton.bounds)
      gif.sd_setImage(with: NSURL(string: (self.fourBtnData[1] as WTSHSMDFourBtn).title_pic)! as URL, placeholderImage: UIImage(named: "wts_loading_img1"))
      self.cellSecondButton.addSubview(gif)
      self.cellSecondLabel.text = (self.fourBtnData[1] as WTSHSMDFourBtn).name
      
      self.cellThirdButton.sd_setBackgroundImage(with: NSURL(string: (self.fourBtnData[2] as WTSHSMDFourBtn).title_pic)! as URL, for: .normal, placeholderImage: UIImage(named: "wts_loading_img1"))
      
      self.cellThirdLabel.text = (self.fourBtnData[2] as WTSHSMDFourBtn).name
      
      
      self.cellFourthButton.sd_setBackgroundImage(with: NSURL(string: (self.fourBtnData[3] as WTSHSMDFourBtn).title_pic)! as URL, for: .normal, placeholderImage: UIImage(named: "wts_loading_img1"))
      
      self.cellFourLabel.text = (self.fourBtnData[3] as WTSHSMDFourBtn).name
      
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
    self.cellFirstLeading.constant = ((XHScreenW - 60) - (self.buttonWidth.constant * 4)) / 3.0
    self.cellSecondLeading.constant = self.cellFirstLeading.constant
    self.cellThirdLeading.constant = self.cellSecondLeading.constant
  }
  
}


