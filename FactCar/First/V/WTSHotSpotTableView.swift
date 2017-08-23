//
//  WTSHotSpotTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit
import ObjectMapper

class WTSHotSpotTableView: WTSRootTableView {
  /// 首页要闻
  var netWorkData: NSMutableArray! = NSMutableArray()
  /// 首页4个button内容
  var fourBtnData: NSArray?
  /// 映射模型
  var hotSpotMoudle: WTSHotSpotMoudle?
  /// 上拉index
  var index:NSNumber! = 1
  override func awakeFromNib() {
    self.separatorStyle = .none
    self.getNetWork()
    self.registerXib()
    super.delegate = self
    super.dataSource = self
  }
  
}

// MARK: - NetWork -
extension WTSHotSpotTableView {
  fileprivate func getNetWork() {
    self.vcType = MoyaNewsCar.hotSpot(index: index)
    self.settingRefersh(refreshSuccess: { result in
      self.hotSpotMoudle = WTSHotSpotMoudle(JSON: result as! [String: Any])!
      let array:NSArray = (self.hotSpotMoudle?.data.hotNewsData as NSArray?)!
      self.netWorkData?.addObjects(from: array as! [Any])
      self.fourBtnData = self.hotSpotMoudle?.data.four_button as NSArray?
      self.reloadData()
    }) { error in
      print("\(error)")
    }
  }
}

// MARK: - Register Xib -
extension WTSRootTableView {
  fileprivate func registerXib() {
    self.register(UINib(nibName: "WTSHotSpotNormalCell", bundle: nil), forCellReuseIdentifier: "HotSpotNormal")
    self.register(UINib(nibName: "WTSHotSpotThirdImgCell", bundle: nil), forCellReuseIdentifier: "HotSpotThirdImage")
    self.register(UINib(nibName: "WTSFourButtonCell", bundle: nil), forCellReuseIdentifier: "HotSpotFourButton")
    self.register(UINib(nibName: "WTSHotSpotAdCell", bundle: nil), forCellReuseIdentifier: "HotSpotAd")
  }
}

// MARK: - UITableViewDelegate && UITableViewDataSource -
extension WTSHotSpotTableView {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if (self.netWorkData?.count) ?? 0 > 0 {
      switch section {
      case 0:
        return 1
      case 1:
        return (self.netWorkData?.count)!
      default:
        return 1
      }
    } else {
      return 1
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell: UITableViewCell = UITableViewCell()
    if (self.netWorkData?.count) ?? 0 == 0 {
      return cell
    }
    let cellData: WTSHSMDNewsData = self.netWorkData![indexPath.row] as! WTSHSMDNewsData
    if indexPath.section == 0 {
      let cell:WTSFourButtonCell = tableView.dequeueReusableCell(withIdentifier: "HotSpotFourButton", for: indexPath) as! WTSFourButtonCell
      cell.fourBtnData = self.fourBtnData as! [WTSHSMDFourBtn]
      return cell
      
    } else {
      if cellData.type == "story" {
        if cellData.imgs.count == 3 {
          
          let cell:WTSHotSpotThirdImgCell = tableView.dequeueReusableCell(withIdentifier: "HotSpotThirdImage", for: indexPath) as! WTSHotSpotThirdImgCell
          cell.thirdImgData = cellData.imgs! as NSArray
          cell.cellTitleLabel.text = cellData.title
          cell.cellAuthorLabel.text = cellData.author
          cell.cellTimeLabel.text = cellData.pub
          return cell
          
        } else {
          
          let cell:WTSHotSpotNormalCell = tableView.dequeueReusableCell(withIdentifier: "HotSpotNormal", for: indexPath) as! WTSHotSpotNormalCell
          cell.cellHeaderImage.sd_setImage(with: URL.init(string: cellData.title_pic1) , placeholderImage: UIImage(named: "focusnews_null_img3"))
          cell.cellTitleLabel.text = cellData.title
          cell.cellAuthorLabel.text = cellData.author
          cell.cellTimeLabel.text = cellData.pub
          
          return cell
        }
        
      } else if cellData.type == "ad_index_underfour" {
        
        let cell:WTSHotSpotAdCell = tableView.dequeueReusableCell(withIdentifier: "HotSpotAd", for: indexPath) as! WTSHotSpotAdCell
        cell.adImgeData = cellData
        return cell
      } else if cellData.type == "" {
        
      }
      
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if self.netWorkData?.count ?? 0 > 0 {
      
      switch indexPath.section {
      case 0:
        return swiftScaleHeight_iPhone6(num: 92)
      case 1:
        let cellData: WTSHSMDNewsData = self.netWorkData![indexPath.row] as! WTSHSMDNewsData
        
        if cellData.type == "ad_index_underfour" {
          return swiftScaleHeight_iPhone6(num: 68.5)
        } else if cellData.type == "story" {
          if cellData.imgs.count == 3 {
            return swiftScaleHeight_iPhone6(num: 152)
          }
          return swiftScaleHeight_iPhone6(num: 100)
        }
        return 100
      default:
        return 100
      }
      
    }
    return 100
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 10
  }
  
}
