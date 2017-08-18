//
//  WTSMarketTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSMarketTableView: WTSRootTableView {

  override func awakeFromNib() {
    self.vcType = MoyaNewsCar.market
    self.settingRefersh(refreshSuccess: { (result) in
      let marketMoudle:WTSNewsMoudleS = WTSNewsMoudleS(JSON: result as! [String : Any])!
      print("\(marketMoudle)")

    }) { (error) in
      print("\(error)")
    }
  }

}
