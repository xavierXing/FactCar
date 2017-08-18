//
//  WTSNewCarTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSNewCarTableView: WTSRootTableView {

  override func awakeFromNib() {
    self.vcType = MoyaNewsCar.newCar
    self.settingRefersh(refreshSuccess: { (result) in
      let newCarMoudle:WTSNewsMoudleS = WTSNewsMoudleS(JSON: result as! [String : Any])!
      print("\(result)")
    }) { (error) in
      print("\(error)")
    }
  }

}
