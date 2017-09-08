//
//  SearchContentVC.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/5.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class SearchContentVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var chooseCollectionView: UICollectionView!
  @IBOutlet weak var contentCollectionView: UICollectionView!
  
  var arrowsImage:UIImageView = UIImageView()
  var chooseStoryTypeLabel:UILabel = UILabel()
  var chooseButton:UIButton?
  @IBAction func chooseStoryType(_ sender: UIButton) {
    chooseButton = sender
    sender.isSelected = !sender.isSelected
    //箭头旋转动画
    let fromValue = sender.isSelected ? 0 : Double.pi
    let toValue = sender.isSelected ? Double.pi : (Double.pi * 2)
    
    let animation = CABasicAnimation(keyPath: "transform.rotation.z")
    animation.fromValue = fromValue
    animation.toValue = toValue
    animation.duration = 0.3
    animation.fillMode = kCAFillModeForwards
    animation.isRemovedOnCompletion = false
    animation.repeatCount = 1
    
    self.arrowsImage.layer.add(animation, forKey: "rotation")
    
    if sender.isSelected {
      self.pullDownAnimationShow()
    } else {
      self.pullDownAnimationHidden()
    }
    
  }
  //获取下拉菜单的contentView
  var searchChoosePullDownContentView:UIView? {
    didSet {
      self.searchChoosePullDownContentView?.backgroundColor = UIColor.black.withAlphaComponent(0.0)
    }
  }
  var searchChoosePullDowmTableView:UITableView? {
    didSet{
      self.searchChoosePullDowmTableView?.frame.origin = CGPoint(x: 0, y: -self.searchChoosePullDowmTableView!.swiftHeight())
    }
  }
  //获取下拉菜单标题栏
  var searchChoosePullDownNavgationView:UIView?
  
  var searchStoryTableView: UITableView? {
    didSet {
      self.settingStoryHeaderOrFooter()
    }
  }
  var searchCarModuleTableView: UITableView? {
    didSet {
      self.settingCarMoudleHeaderOrFooter()
    }
  }
  var searchVideoTableView: UITableView? {
    didSet {
      self.settingVideoHeaderOrFooter()
    }
  }
  
  var searchStoryArray:NSMutableArray = NSMutableArray()
  var searchCarModulArray:NSMutableArray = NSMutableArray()
  var searchVideoArray:NSMutableArray = NSMutableArray()
  
  let chooseCollectSource: [String]! = ["文章", "车型", "视频"]
  let choosePullDownSource: [String]! = ["全部","资讯","行情"]
  let storyTypeArray: [String]! = ["0","2285","65"]
  var index: Int? = 0
  
  var page: Int = 1
  var keyWord: String?
  var storyType: String! = "0"
  
  var carModulePage: Int = 1
  var videoPage: Int = 1
  
  var storyCollectionCell:UIView = UIView()
  var chooseIndex: Int? = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
  }
  
}
// MARK: - UICollectionViewDelegate && UICollectionViewDataSource -
extension SearchContentVC {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch collectionView.tag {
    case 1000:
      /// 文章 | 车型 | 视频
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chooseItem", for: indexPath)
      let chooseTitleLabel: UILabel = cell.viewWithTag(2) as! UILabel
      let chooseTitleView = cell.viewWithTag(1)!
      chooseTitleLabel.text = chooseCollectSource[indexPath.row]
      chooseTitleLabel.textColor = indexPath.row == index ? UIColor.colorWithHexString(hex: "#FF142E") : UIColor.colorWithHexString(hex: "#333333")
      chooseTitleView.backgroundColor = indexPath.row == index ? UIColor.colorWithHexString(hex: "#FF142E") : UIColor.colorWithHexString(hex: "#999999")
      return cell
    case 1001:
      /// 文章 | 车型 | 视频 (内容)
      switch indexPath.item {
      case 0:
        self.storyCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentItemStory", for: indexPath)
        self.searchStoryTableView = self.storyCollectionCell.viewWithTag(1) as? UITableView
        self.arrowsImage = self.storyCollectionCell.viewWithTag(100) as! UIImageView
        self.searchChoosePullDownContentView = self.storyCollectionCell.viewWithTag(101)
        self.searchChoosePullDownNavgationView = self.storyCollectionCell.viewWithTag(10)
        self.chooseStoryTypeLabel = self.storyCollectionCell.viewWithTag(102) as! UILabel
        
        return self.storyCollectionCell as! UICollectionViewCell
      case 1:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentItemCarMoudle", for: indexPath)
        self.searchCarModuleTableView = cell.viewWithTag(2) as? UITableView
        return cell
      case 2:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentItemVideo", for: indexPath)
        self.searchVideoTableView = cell.viewWithTag(3) as? UITableView
        return cell
      default:
        break
      }
      
      break
    default:
      break
    }
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "index", for: indexPath)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    switch collectionView.tag {
    case 1000:
      index = indexPath.row
      self.settingContentCollectionViewOffset(index: index!)
      collectionView.reloadData()
      break
    case 1001:
      
      break
      
    default:
      break
    }
    
  }
  
}
// MARK: - UIScrollViewDelegate -
extension SearchContentVC {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if scrollView.tag == 1001 {
      let chooseIndex = scrollView.contentOffset.x / XHScreenW
      index = Int(chooseIndex)
      self.chooseCollectionView.reloadData()
    }
    
  }
}
// MARK: - UITableViewDelegate && UITableViewDataSource -
extension SearchContentVC {
  func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch tableView.tag {
      //文章
    case 1:
      return self.searchStoryArray.count
      //车型
    case 2:
      return self.searchCarModulArray.count
      //视频
    case 3:
      return self.searchVideoArray.count
      //文章: 下拉菜单
    case 4:
      return 3
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch tableView.tag {
      //文章
    case 1:
      let cell: SearchStoryCell = tableView.dequeueReusableCell(withIdentifier: "searchStoryCell", for: indexPath) as! SearchStoryCell
      cell.searchStoryParameter = self.searchStoryArray[indexPath.row] as? SearchStoryParameter
      return cell
      //车型
    case 2:
      let cell: SearchCarMoudleCell = tableView.dequeueReusableCell(withIdentifier: "searchCarMoudleCell", for: indexPath) as! SearchCarMoudleCell
      cell.bseries = self.searchCarModulArray[indexPath.row] as? Bseries
      return cell
      //视频
    case 3:
      let cell: SearchVideoCell = tableView.dequeueReusableCell(withIdentifier: "searchVideoCell", for: indexPath) as! SearchVideoCell
      cell.video = self.searchVideoArray[indexPath.row] as? Video
      return cell
      //文章: 下拉菜单
    case 4:
      self.searchChoosePullDowmTableView = tableView
      let cell = tableView.dequeueReusableCell(withIdentifier: "chooseStoryPullDownCell", for: indexPath)
      let chooseLabel:UILabel = cell.viewWithTag(10) as! UILabel
      let arrowsImage:UIImageView = cell.viewWithTag(11) as! UIImageView
      chooseLabel.textColor = chooseIndex == indexPath.row ? UIColor.colorWithHexString(hex: "#FF142E") : UIColor.colorWithHexString(hex: "#999999")
      arrowsImage.isHidden = chooseIndex == indexPath.row ? false : true
      chooseLabel.text = choosePullDownSource[indexPath.row]
      return cell
    default:
      return UITableViewCell(style: .default, reuseIdentifier: "default")
    }
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch tableView.tag {
      //文章
    case 1:
      break
      //车型
    case 2:
      break
      //视频
    case 3:
      break
      //文章: 下拉菜单
    case 4:
      chooseIndex = indexPath.row
      self.chooseStoryType(chooseButton!)
      self.chooseStoryTypeLabel.text = choosePullDownSource[chooseIndex!]
      tableView.reloadData()
      
      storyType = storyTypeArray[chooseIndex!]
      self.searchStoryTableView?.mj_header.beginRefreshing()
      
      break
    default:
      break
    }
  }
  
}
// MARK: - Private Method -
extension SearchContentVC {
  fileprivate func settingContentCollectionViewOffset(index: Int) {
    self.contentCollectionView.setContentOffset(CGPoint(x: CGFloat(index) * XHScreenW, y: 0), animated: true)
  }
  // 设置文章界面刷新控件
  fileprivate func settingStoryHeaderOrFooter() {
    let storyRefreshHeader: WTSFactCarRefreshGifHeader = WTSFactCarRefreshGifHeader {
      self.searchStoryArray.removeAllObjects()
      self.page = 1
      self.getNetWork()
    }
    
    let storyRefreshFooter: MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter {
      self.getNetWork()
      
    }
    
    self.searchStoryTableView?.mj_header = storyRefreshHeader
    self.searchStoryTableView?.mj_footer = storyRefreshFooter
    
    self.searchStoryTableView?.mj_header.beginRefreshing()
    self.searchStoryTableView?.mj_footer.endRefreshing()
  }
  // 设置车型界面刷新控件
  fileprivate func settingCarMoudleHeaderOrFooter() {
    let carMoudleRefreshHeader:WTSFactCarRefreshGifHeader = WTSFactCarRefreshGifHeader {
      self.searchCarModulArray.removeAllObjects()
      self.carModulePage = 1
      self.getCarModuleNetWork()
    }
    
    let carMoudleRefreshFooter: MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter {
      self.getCarModuleNetWork()
    }
    
    self.searchCarModuleTableView?.mj_header = carMoudleRefreshHeader
    self.searchCarModuleTableView?.mj_footer = carMoudleRefreshFooter
    
    self.searchCarModuleTableView?.mj_header.beginRefreshing()
    self.searchCarModuleTableView?.mj_footer.endRefreshing()
    
  }
  
  // 设置视频界面刷新控件
  fileprivate func settingVideoHeaderOrFooter() -> Void {
    let videoRefreshHeader:WTSFactCarRefreshGifHeader = WTSFactCarRefreshGifHeader {
      self.searchVideoArray.removeAllObjects()
      self.videoPage = 1
      self.getVideoNetWork()
    }
    
    let videoRefreshFooter:MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter {
      self.getVideoNetWork()
    }
    
    self.searchVideoTableView?.mj_header = videoRefreshHeader
    self.searchVideoTableView?.mj_footer = videoRefreshFooter
    
    self.searchVideoTableView?.mj_header.beginRefreshing()
    self.searchVideoTableView?.mj_footer.endRefreshing()
  }
  
  fileprivate func pullDownAnimationShow() -> Void {
    (self.storyCollectionCell as! UICollectionViewCell).contentView.exchangeSubview(at: 2, withSubviewAt: 0)
    self.searchChoosePullDowmTableView?.frame.origin = CGPoint(x: 0, y: -(self.searchChoosePullDowmTableView!.swiftHeight()))
    //开始下拉菜单动画
    UIView.animate(withDuration: 0.5, animations: {
      self.searchChoosePullDownContentView?.backgroundColor = UIColor.black.withAlphaComponent(0.75)
      self.searchChoosePullDowmTableView?.frame.origin = CGPoint(x: 0, y: 38)
    }) { (_) in
      self.searchChoosePullDowmTableView?.frame.origin = CGPoint(x: 0, y: 38)
    }
  }
  
  fileprivate func pullDownAnimationHidden() -> Void {
    //结束下拉菜单动画
    UIView.animate(withDuration: 0.5, animations: {
      self.searchChoosePullDownContentView?.backgroundColor = UIColor.black.withAlphaComponent(0.0)
      self.searchChoosePullDowmTableView?.frame.origin = CGPoint(x: 0, y: -(self.searchChoosePullDowmTableView!.swiftHeight()))
    }) { (_) in
      self.searchChoosePullDowmTableView?.frame.origin = CGPoint(x: 0, y: -(self.searchChoosePullDowmTableView!.swiftHeight()))
      (self.storyCollectionCell as! UICollectionViewCell).contentView.exchangeSubview(at: 0, withSubviewAt: 2)
      
    }
  }
  
}
// MARK: - Net Work -
extension SearchContentVC {
  fileprivate func getNetWork() {
    let moyaType: MoyaSearch = MoyaSearch.searchStory(page: page, keyWord: keyWord!, storyType: storyType)
    netWorkManager.moyaGetSearchData(type: moyaType, success: { result in
      
      let searchStory = SearchStory(JSON: result as! [String : Any])
      if searchStory?.code == 200 {
        let searchStoryDataArray:[SearchStoryParameter] = (searchStory?.data.story)!
        self.searchStoryArray.addObjects(from: searchStoryDataArray)
        self.searchStoryTableView?.reloadData()
      }
      
      self.searchStoryTableView?.mj_header.endRefreshing()
      self.searchStoryTableView?.mj_footer.endRefreshing()
      self.page += 1
      
    }) { error in
      print("\(error)")
      self.searchStoryTableView?.mj_footer.endRefreshing()
    }
  }
  
  fileprivate func getCarModuleNetWork() -> Void {
    let moyaType: MoyaSearch = MoyaSearch.searchCarMoudle(page: carModulePage, keyWord: keyWord!)
    netWorkManager.moyaGetSearchData(type: moyaType, success: { (result) in
      let searchCarModule = SearchCarModuleModel(JSON: result as! [String : Any])
      if searchCarModule?.code == 200 {
        let searchCarModuleArray:[Bseries] = (searchCarModule?.data.bseries)!
        if searchCarModuleArray.count == 0 {
          self.searchCarModuleTableView?.mj_footer.endRefreshingWithNoMoreData()
          return
        }
        self.searchCarModulArray.addObjects(from: searchCarModuleArray)
        self.searchCarModuleTableView?.reloadData()
        
        self.searchCarModuleTableView?.mj_header.endRefreshing()
        self.searchCarModuleTableView?.mj_footer.endRefreshing()
      }
    }) { (error) in
      self.searchCarModuleTableView?.mj_footer.endRefreshing()
      print(error)
    }
  }
  
  fileprivate func getVideoNetWork() -> Void {
    let moyaType: MoyaSearch = MoyaSearch.searchVideo(page: videoPage, keyWord: keyWord!)
    netWorkManager.moyaGetSearchData(type: moyaType, success: { (result) in
      let searchVideo = SearchVideo(JSON: result as! [String : Any])
      if searchVideo?.code == 200 {
        let searchVideoModuleArray:[Video] = (searchVideo?.data.vedio)!
        if searchVideoModuleArray.count == 0 {
          self.searchVideoTableView?.mj_footer.endRefreshingWithNoMoreData()
        }
        self.searchVideoArray.addObjects(from: searchVideoModuleArray)
        self.searchVideoTableView?.reloadData()
        
        self.searchVideoTableView?.mj_header.endRefreshing()
        self.searchVideoTableView?.mj_footer.endRefreshing()
        
      }
    }) { (error) in
      self.searchVideoTableView?.mj_footer.endRefreshing()
      print(error)
    }
  }
  
}
