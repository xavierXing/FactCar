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
  
  var arrowsImage:UIImageView? = UIImageView()
  @IBAction func chooseStoryType(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    
    let fromValue = sender.isSelected ? 0 : Double.pi
    let toValue = sender.isSelected ? Double.pi : (Double.pi * 2)
    
    let animation = CABasicAnimation(keyPath: "transform.rotation.z")
    animation.fromValue = fromValue
    animation.toValue = toValue
    animation.duration = 0.3
    animation.fillMode = kCAFillModeForwards
    animation.isRemovedOnCompletion = false
    animation.repeatCount = 1
    
    self.arrowsImage?.layer.add(animation, forKey: "rotation")
  }
  
  
  var searchStoryTableView: UITableView? {
    didSet {
      self.settingStoryHeaderOrFooter()
    }
  }
  var searchCarModuleTableView: UITableView?
  var searchVideoTableView: UITableView?
  
  var searchStoryArray:NSMutableArray = NSMutableArray()
  
  let chooseCollectSource: [String]! = ["文章", "车型", "视频"]
  var index: Int? = 0
  
  var page: Int? = 1
  var keyWord: String?
  var storyType: String! = "0"
  
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentItemStory", for: indexPath)
        self.searchStoryTableView = cell.viewWithTag(1) as? UITableView
        self.arrowsImage = cell.viewWithTag(100) as? UIImageView
        return cell
      case 1:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentItemCarMoudle", for: indexPath)
        
        return cell
      case 2:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentItemVideo", for: indexPath)
        
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
    
    let chooseIndex = scrollView.contentOffset.x / XHScreenW
    index = Int(chooseIndex)
    self.chooseCollectionView.reloadData()
    
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
      return self.searchStoryArray.count
      //视频
    case 3:
      return self.searchStoryArray.count
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch tableView.tag {
    case 1:
      let cell: SearchStoryCell = tableView.dequeueReusableCell(withIdentifier: "searchStoryCell", for: indexPath) as! SearchStoryCell
      cell.searchStoryParameter = self.searchStoryArray[indexPath.row] as? SearchStoryParameter
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
      return cell
    default:
      return UITableViewCell(style: .default, reuseIdentifier: "default")
    }
    
  }
}
// MARK: - Private Method -
extension SearchContentVC {
  fileprivate func settingContentCollectionViewOffset(index: Int) {
    self.contentCollectionView.setContentOffset(CGPoint(x: CGFloat(index) * XHScreenW, y: 0), animated: true)
  }
  
  fileprivate func settingStoryHeaderOrFooter() {
    let storyRefreshHeader: WTSFactCarRefreshGifHeader = WTSFactCarRefreshGifHeader {
      self.searchStoryArray.removeAllObjects()
      self.page! = 1
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
  
}
// MARK: - Net Work -
extension SearchContentVC {
  fileprivate func getNetWork() {
    let moyaType: MoyaSearch = MoyaSearch.searchStory(page: page!, keyWord: keyWord!, storyType: storyType)
    netWorkManager.moyaGetSearchData(type: moyaType, success: { result in
      
      let searchStory = SearchStory(JSON: result as! [String : Any])
      if searchStory?.code == 200 {
        let searchStoryDataArray:[SearchStoryParameter] = (searchStory?.data.story)!
        self.searchStoryArray.addObjects(from: searchStoryDataArray)
        self.searchStoryTableView?.reloadData()
      }
      
      self.searchStoryTableView?.mj_header.endRefreshing()
      self.searchStoryTableView?.mj_footer.endRefreshing()
      self.page! += 1
      
    }) { error in
      print("\(error)")
      self.searchStoryTableView?.mj_footer.endRefreshing()
    }
  }
}
