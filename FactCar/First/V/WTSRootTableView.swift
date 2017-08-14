//
//  WTSRootTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

protocol WTSRootVCTableViewDelegate {
  
}

enum VCType: Int {
  case hotSpot ///热点
  case video ///视频
  case live ///直播
  case business ///行业
  case evaluating ///评测
  case shopping ///导购
  case newCar ///新车
  case useCar ///用车
  case calture ///文化
  case travel ///旅游
  case technology ///技术
  case market /// 市场
}

class WTSRootTableView: UITableView {
  
  var rootDelegate: WTSRootVCTableViewDelegate?
  
  /// 网络数据接口
  var refreshLinkUrl: NSString?
  /// 刷新数据信息
  var refreshAfterDataArray: NSArray?
  /// Moya
  let moyaServer: NewsNetServer = NewsNetServer()
  /// 枚举
  var vcType: VCType?
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }

  /// xib初始化
  override func awakeFromNib() {
    super.awakeFromNib()
    self.settingBasic()
    
  }

}

extension WTSRootTableView {
  
  public func settingRefersh(refreshSuccess: @escaping  (_ result : NSDictionary) -> (), refreshFailed: @escaping (_ error: String) -> ()) -> Void {
    let refreshHeader:WTSFactCarRefreshGifHeader = WTSFactCarRefreshGifHeader {
      switch (VCType.hotSpot) {
      case VCType.hotSpot:
        
        break
       
      }
      
      
      self.moyaServer.getHotSpotData(success: { (result) in
        refreshSuccess(result)
      }, failed: { (error) in
        refreshFailed(error)
      })

    }
    let refreshFooter:MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter { 
      print("上拉加载")
    }
    self.mj_header = refreshHeader
    self.mj_footer = refreshFooter
    self.mj_header.beginRefreshing()
    self.mj_footer.endRefreshing()
  }
  
  fileprivate func settingBasic() -> Void {
    self.separatorStyle = .none
  }
}

