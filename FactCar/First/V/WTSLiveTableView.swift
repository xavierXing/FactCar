//
//  WTSLiveTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSLiveTableView: WTSRootTableView {

  var index: Int! = 1

  var videoListArray: NSMutableArray = NSMutableArray()

  override func awakeFromNib() {
    self.getNetWork()
    self.settingRefreshFooter()
  }

}
// MARK: - NetWork -
extension WTSLiveTableView {

  fileprivate func getNetWork() {
    self.vcType = MoyaNewsCar.live(index: index! as NSNumber)
    self.settingRefersh(refreshSuccess: { result, _ in
      let liveMoudle: WTSLiveMoudle = WTSLiveMoudle(JSON: result as! [String: Any])!
      if liveMoudle.code == 200 {
        let videoList: [WTSLVideoList] = liveMoudle.data.vedio_list
        self.videoListArray.removeAllObjects()
        self.videoListArray.addObjects(from: videoList)
        if self.videoListArray.count > 0 {
          super.delegate = self
          super.dataSource = self
          self.reloadData()
        }

      }

    }) { error in
      print("\(error)")
    }
  }
}
// MARK: - UITableViewDelegate && UITableViewDataSource -
extension WTSLiveTableView {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.videoListArray.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: LiveShowCell = tableView.dequeueReusableCell(withIdentifier: "liveCell", for: indexPath) as! LiveShowCell
    cell.liveList = self.videoListArray[indexPath.row] as? WTSLVideoList
    return cell
  }
}
// MARK: - Private Method -
extension WTSLiveTableView {
  fileprivate func settingRefreshFooter() {
    self.mj_footer = nil
    let moreButton: UIButton = self.tableFooterView?.viewWithTag(111) as! UIButton
    moreButton.addTarget(for: .touchUpInside) { _ in
      self.index! += 1
      let moyaType: MoyaNewsCar = MoyaNewsCar.live(index: self.index! as NSNumber)
      self.moyaServer.moyaGetData(type: moyaType, success: { result in

        let liveMoudle: WTSLiveMoudle = WTSLiveMoudle(JSON: result as! [String: Any])!
        if liveMoudle.data == nil {
          return
        }
        if liveMoudle.code == 200 {
          let videoList: [WTSLVideoList] = liveMoudle.data.vedio_list
          self.videoListArray.addObjects(from: videoList)
          if self.videoListArray.count > 0 {
            self.reloadData()
          }
          
        }
      }) { error in
        print(error)
      }
    }
  }
}

