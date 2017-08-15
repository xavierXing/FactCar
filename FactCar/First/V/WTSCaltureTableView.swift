//
//  WTSCaltureTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSCaltureTableView: WTSRootTableView {

  override func awakeFromNib() {
    self.vcType = MoyaNewsCar.calture
    self.settingRefersh(refreshSuccess: { (result) in
      print("\(result)")
    }) { (error) in
      print("\(error)")
    }
  }

}
