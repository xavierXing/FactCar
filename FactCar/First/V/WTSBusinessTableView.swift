//
//  WTSBusinessTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSBusinessTableView: WTSRootTableView {
  
  var index: Int = 1
  var newsArray: NSMutableArray = NSMutableArray()
  override func awakeFromNib() {
    self.getNetWork()
    self.registerNib()
  }
 
}
// MARK: - NetWork -
extension WTSBusinessTableView {
  fileprivate func getNetWork() -> Void {
    
    self.vcType = MoyaNewsCar.business(index: index as NSNumber)
    self.settingRefersh(refreshSuccess: { (result,refreshType) in
      let businessMoudle:WTSNewsMoudleS = WTSNewsMoudleS(JSON: result as! [String : Any])!
      if businessMoudle.code == 200 {
        let newsData:[WTSNewsMoudle_data] = businessMoudle.data
        self.newsArray.addObjects(from: newsData)
        if self.newsArray.count > 0 {
          super.dataSource = self
          super.delegate = self
          self.reloadData()
        }
      }
      print("\(result)")
    }) { (error) in
      print("\(error)")
    }
  }
}
// MARK: - Private Method -
extension WTSBusinessTableView {
  fileprivate func registerNib() -> Void {
    self.register(UINib(nibName: "WTSHotSpotNormalCell", bundle: nil), forCellReuseIdentifier: "HotSpotNormal")
    self.register(UINib(nibName: "WTSHotSpotThirdImgCell", bundle: nil), forCellReuseIdentifier: "HotSpotThirdImage")
  }
}
// MARK: - UITableViewDelegate && UITableViewDataSource -
extension WTSBusinessTableView {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let newsData:WTSNewsMoudle_data = self.newsArray[indexPath.row] as! WTSNewsMoudle_data
    if newsData.imgs.count > 0 {
      return 165
    }
    return 100
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.newsArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let newsData:WTSNewsMoudle_data = self.newsArray[indexPath.row] as! WTSNewsMoudle_data
    if newsData.imgs.count > 0 {
      let cell:WTSHotSpotThirdImgCell = tableView.dequeueReusableCell(withIdentifier: "HotSpotThirdImage", for: indexPath) as! WTSHotSpotThirdImgCell
      cell.thirdImgData = newsData.imgs! as NSArray
      cell.hotSpotData = newsData
      return cell
    }
    let cell:WTSHotSpotNormalCell = tableView.dequeueReusableCell(withIdentifier: "HotSpotNormal", for: indexPath) as! WTSHotSpotNormalCell
    cell.hotSpotData = newsData
    return cell
    
  }
  
}
