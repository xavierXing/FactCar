//
//  WTSVideoTableView.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSVideoTableView: WTSRootTableView, UICollectionViewDelegate, UICollectionViewDataSource {
  
  var index:Int! = 1
  
  var collectionView: UICollectionView?
  
  var videoFocusArray: [WTSVMDFocus] = []
  var videoConfigArray: [WTSVMDConfig] = []
  var videoVideoListArray: NSMutableArray = NSMutableArray()
  
  let collectionImages: [String] = ["carbook", "originaling", "shareing"]
  
  override func awakeFromNib() {
    self.getNetWork()
    
  }
  
}
// MARK: - NetWork -
extension WTSVideoTableView {
  fileprivate func getNetWork() {
    self.vcType = MoyaNewsCar.video(index: index! as NSNumber)
    self.settingRefersh(refreshSuccess: { result,refreshType in
      let videoMoudle: WTSVideoMoudle = WTSVideoMoudle(JSON: result as! [String: Any])!
      if videoMoudle.code == 200 {
        if refreshType == .pullDown {
          self.videoVideoListArray.removeAllObjects()
        }
        let data: WTSVMData = videoMoudle.data
        self.videoFocusArray = data.focus!
        self.videoConfigArray = data.config!
        let videoList: [WTSVMDVideoList] = data.vedio_list!
        
        super.delegate = self
        super.dataSource = self
        
        if self.videoFocusArray.count > 0 {
          self.settingHeaderCarouselView()
        }
        
        self.videoVideoListArray.addObjects(from: videoList)
        self.reloadData()
        self.collectionView?.reloadData()
      }
    
    }) { error in
      print("\(error)")
    }
  }
}
// MARK: - UITableViewDataSource && UITableViewDelegate -
extension WTSVideoTableView {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 115
    }
    return 100
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.videoVideoListArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "videoCollectionCell", for: indexPath)
      self.collectionView = cell.viewWithTag(103) as? UICollectionView
      return cell
    }
    
    let cell: VideoPlayCell = tableView.dequeueReusableCell(withIdentifier: "videoPlayCell", for: indexPath) as! VideoPlayCell
    cell.videoList = self.videoVideoListArray[indexPath.row] as? WTSVMDVideoList
    return cell
  }
  
}
// MARK: - UICollectionViewDelegate && UICollectionViewDataSource -
extension WTSVideoTableView {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: VideoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCollectionItem", for: indexPath) as! VideoCollectionViewCell
    cell.headerImage.image = UIImage(named: self.collectionImages[indexPath.row])
    cell.config = self.videoConfigArray[indexPath.row]
    
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.row)
  }
  
}

// MARK: - 设置轮播图 -
extension WTSVideoTableView {
  
  fileprivate func settingHeaderCarouselView() -> () {
    
    let carousel:NSMutableArray! = NSMutableArray()
    let titleArray:NSMutableArray! = NSMutableArray()
    for i in 0..<self.videoFocusArray.count {
      let carouselImgaeUrl = self.videoFocusArray[i].img
      carousel?.add(carouselImgaeUrl ?? "no link")
      let title = self.videoFocusArray[i].alt
      titleArray.add(title ?? "no title")
    }
    
    let carouselView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: XHScreenW, height: XHScreenW / 2), imageURLStringsGroup: carousel as! [Any])
    carouselView?.titlesGroup = titleArray as! [Any]!
    carouselView?.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
    carouselView?.currentPageDotColor = UIColor.white
    carouselView?.placeholderImage = UIImage(named: "focusnews_null_img3")
    carouselView?.clickItemOperationBlock = { index in
      print("\(index)")
    }
    self.tableHeaderView = carouselView
  }
  
}

