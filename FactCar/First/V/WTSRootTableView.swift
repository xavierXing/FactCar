//
//  WTSRootTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSRootTableView: UITableView {

  override func layoutSubviews() {
    super.layoutSubviews()
    print("......")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    print("触摸了")
  }
  ///xib初始化
  override func awakeFromNib() {
    super.awakeFromNib()
    print("一杯敬故乡")
  }
  
}
