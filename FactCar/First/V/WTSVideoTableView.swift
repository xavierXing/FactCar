//
//  WTSVideoTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSVideoTableView: WTSRootTableView {

  override func awakeFromNib() {
    self.vcType = MoyaNewsCar.video
    self.settingRefersh(refreshSuccess: { (result) in
      let videoMoudle:WTSVideoMoudle = WTSVideoMoudle(JSON: result as! [String : Any])!
      print("\(result)")
    }) { (error) in
      print("\(error)")
    }
  }
}
