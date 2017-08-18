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

enum VCType {
  case hotSpot,video,live,business,evaluating,shopping,newCar,useCar,calture,travel,technology,market
}

class WTSRootTableView: UITableView,UITableViewDataSource,UITableViewDelegate {
  
  var rootDelegate: WTSRootVCTableViewDelegate?
  
  /// 网络数据接口
  var refreshLinkUrl: NSString?
  /// 刷新数据信息
  var refreshAfterDataArray: NSArray?
  /// Moya
  let moyaServer: NewsNetServer = NewsNetServer()
  /// 控制器类型
  var vcType: MoyaNewsCar?
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }

  /// xib初始化
  override func awakeFromNib() {
    super.awakeFromNib()
    self.settingBasic()
    
  }

}

// MARK: - Public Method -
extension WTSRootTableView {
  
  public func settingRefersh(refreshSuccess: @escaping  (_ result : NSDictionary) -> (), refreshFailed: @escaping (_ error: String) -> ()) -> Void {

    let refreshHeader:WTSFactCarRefreshGifHeader = WTSFactCarRefreshGifHeader {
      
      self.moyaServer.moyaGetData(type: self.vcType!, success: { (result) in
        refreshSuccess(result)
        self.mj_header.endRefreshing()
      }) { (error) in
        refreshFailed(error)
        self.mj_header.endRefreshing()
      }
    
    }
    
    let refreshFooter:MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter { 
      print("上拉加载")
    }
    self.mj_header = refreshHeader
    self.mj_footer = refreshFooter
    self.mj_header.beginRefreshing()
    self.mj_footer.endRefreshing()
  }
  

}

// MARK: - Privte Method -
extension WTSRootTableView {
  fileprivate func settingBasic() -> Void {
    self.separatorStyle = .none
  }
  
  fileprivate func getHotSpot() -> Void {
    
  }
}

// MARK: - UITableViewDataSource && UITableViewDelegate -
extension WTSRootTableView {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "RootVC")!
    cell.backgroundColor = UIColor.green
    return cell
  }
}

