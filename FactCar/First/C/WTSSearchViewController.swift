//
//  WTSSearchViewController.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/25.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSSearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate {

  @IBOutlet weak var searchTextField: UITextField!

  @IBOutlet weak var searchContentTableView: UITableView!
  
  @IBAction func searchAction(_ sender: Any) {
    self.dismiss(animated: true) {

    }
  }
  ///下拉刷新页数
  var pageIndex:Int! = 1
  
  var searchMoudle:SearchMoudle?
  var storyArray:[Story]?
  var searchAD:Search_ad?
  var tagHotArr:[TagHotArr]?
  var storyMutableArray:NSMutableArray? = NSMutableArray()
  
  var hotSpotCollectionView:UICollectionView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.getNetWork()
    self.settingRefreshFooter()
    self.registerNib()
    self.searchContentTableView.rowHeight = UITableViewAutomaticDimension
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? SearchContentVC, let sender = sender as? SearchHotSpotLabelsCell {
      sender.heroID = "selected" + String(sender.tag)
      vc.view.heroModifiers = [.source(heroID: "selected")]
      vc.searchTextField.text = sender.hotSpotTag.text
      vc.searchTextField.heroID = "selected" + String(sender.tag)
      vc.searchTextField.heroModifiers = [.durationMatchLongest]
      
    }
  }

}

extension WTSSearchViewController {
  fileprivate func registerNib() {
      self.searchContentTableView.register(UINib(nibName: "WTSSearchHeaderViewTableViewCell", bundle: nil), forCellReuseIdentifier: "searchHeaderView")
    
  }
}

// MARK: - UITableViewDataSource && UITableViewDelegate -
extension WTSSearchViewController {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var numberRows:Int! = 0
    switch section {
    case 0:
      numberRows = 1
      break
    case 1:
      numberRows = self.storyMutableArray?.count
      break
    default:
      break
    }
    return numberRows
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell:WTSSearchHeaderViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "searchHeaderView") as! WTSSearchHeaderViewTableViewCell
    var sessionImg:UIImage?
    var sessionText:String?
    switch section {
    case 0:
      sessionImg = UIImage(named: "hotLabel")
      sessionText = "热门标签"
      break
    case 1:
      sessionImg = UIImage(named: "hotArticle")
      sessionText = "热门文章"
      break
    default:
      break
    }
    
    cell.sessionImg.image = sessionImg
    cell.sessionLabel.text = sessionText
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "searchHotSpotLabels", for: indexPath)
      return cell
    case 1:
      let cell:SearchContentCell = tableView.dequeueReusableCell(withIdentifier: "searchContentCell", for: indexPath) as! SearchContentCell
      cell.story = (self.storyMutableArray![indexPath.row] as! Story)
      return cell
    default:
      break
    }
    
    return UITableViewCell()
  }

  
}
// MARK: - UICollectionViewDataSource && UICollectionViewDelegate -
extension WTSSearchViewController {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell:SearchHotSpotLabelsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchHotSpotItem", for: indexPath) as! SearchHotSpotLabelsCell
    cell.hotSpotTag.text = (self.tagHotArr?[indexPath.item])?.title
    cell.hotSpotTag.textColor = (self.tagHotArr?[indexPath.item])?.color == "blue" ? (UIColor.colorWithHexString(hex: "#73a9ee")) : (UIColor.colorWithHexString(hex: "#f7af26"))
    cell.layer.borderColor = cell.hotSpotTag.textColor.cgColor
    cell.hotSpotTag.backgroundColor = (self.tagHotArr?[indexPath.item])?.color == "blue" ? (UIColor.colorWithHexString(hex: "#ecf3fd")) : (UIColor.colorWithHexString(hex: "#fcf5e8"))
    self.hotSpotCollectionView = collectionView
    cell.tag = (indexPath.item + 1000)
    return cell
    
  }
}

extension WTSSearchViewController {

  fileprivate func settingRefreshFooter() -> () {
    let refreshFooter:MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter {
      self.getNetWork()
    }
    self.searchContentTableView.mj_footer = refreshFooter
  }
  
  fileprivate func getNetWork() -> () {
    let netWorkManager:SearchNetServer = SearchNetServer()
    let moyaType:MoyaSearch = MoyaSearch.searchContent(page: pageIndex)
    netWorkManager.moyaGetSearchData(type: moyaType, success: { (result) in
      self.searchMoudle = SearchMoudle(JSON: result as! [String:Any])!
      if self.searchMoudle?.code == 200 {
        self.searchAD = self.searchMoudle?.data.search_ad
        self.storyArray = self.searchMoudle?.data.story
        self.tagHotArr = self.searchMoudle?.data.tagHotArr
        
        let transit:NSArray = self.storyArray! as NSArray
        self.storyMutableArray?.addObjects(from: transit as! [Any])
        self.searchContentTableView.reloadData()
        self.hotSpotCollectionView?.reloadData()
        
        self.pageIndex! += 1
      }
      self.searchContentTableView.mj_footer.endRefreshing()
    }) { (error) in
      self.searchContentTableView.mj_footer.endRefreshing()
      print("\(error)")
    }
  }
}

