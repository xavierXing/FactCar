//
//  WTSUseCarTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSUseCarTableView: WTSRootTableView {

  override func awakeFromNib() {
    self.vcType = MoyaNewsCar.useCar
    self.settingRefersh(refreshSuccess: { (result) in
      let userMoudle:WTSNewsMoudleS = WTSNewsMoudleS(JSON: result as! [String : Any])!
      print("\(result)")
    }) { (error) in
      print("\(error)")
    }
  }

}
