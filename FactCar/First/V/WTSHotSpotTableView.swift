//
//  WTSHotSpotTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSHotSpotTableView: WTSRootTableView {
  
  override func awakeFromNib() {
    self.getNetWork()
    super.delegate = self
    super.dataSource = self
  }
  
}

extension WTSHotSpotTableView {
  fileprivate func getNetWork() -> Void {
    self.vcType = MoyaNewsCar.hotSpot
    self.settingRefersh(refreshSuccess: { (result) in
      let hotSpotMoudle: WTSHotSpotMoudle = WTSHotSpotMoudle(JSON: result as! [String : Any])!
      
    }) { (error) in
      print("\(error)")
    }
  }
}
//// MARK: - UITableViewDelegate -
extension WTSHotSpotTableView {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "111")!
    cell.backgroundColor = UIColor.green
    return cell
  }
  
}
