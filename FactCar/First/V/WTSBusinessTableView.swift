//
//  WTSBusinessTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSBusinessTableView: WTSRootTableView {

  override func awakeFromNib() {
    self.vcType = MoyaNewsCar.business
    self.settingRefersh(refreshSuccess: { (result) in
      let businessMoudle:WTSNewsMoudleS = WTSNewsMoudleS(JSON: result as! [String : Any])!
      print("\(result)")
    }) { (error) in
      print("\(error)")
    }
  }

}
