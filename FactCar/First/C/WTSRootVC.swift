//
//  WTSRootVC.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/7.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit
import Lottie

class WTSRootVC: UIViewController, UIScrollViewDelegate,UIViewControllerTransitioningDelegate {
  
  ///是否滚动title
  var isScrollEnable: Bool = false
  var isCollectionTitleViewEnable: Bool = false
  
  ///约束
  @IBOutlet weak var hotSpotWidth: NSLayoutConstraint!
  @IBOutlet weak var scrollViewContentSizeWidth: NSLayoutConstraint!
  
  @IBOutlet weak var videoLeft: NSLayoutConstraint!
  @IBOutlet weak var videoRight: NSLayoutConstraint!
  
  @IBOutlet weak var liveRight: NSLayoutConstraint!
  
  @IBOutlet weak var businessRight: NSLayoutConstraint!
  
  @IBOutlet weak var evaluatingLeft: NSLayoutConstraint!
  @IBOutlet weak var evaluatingRight: NSLayoutConstraint!
  
  @IBOutlet weak var shoppingRight: NSLayoutConstraint!
  
  @IBOutlet weak var newCarRight: NSLayoutConstraint!
  
  @IBOutlet weak var useCarRight: NSLayoutConstraint!
  
  @IBOutlet weak var cultureRight: NSLayoutConstraint!
  
  @IBOutlet weak var travelRight: NSLayoutConstraint!
  
  @IBOutlet weak var technologyRight: NSLayoutConstraint!
  
  @IBOutlet weak var navgationItem: UINavigationItem!
  
  ///content
  @IBOutlet weak var contentScrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.settingNavgationBar()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.customNavgation.settingCollectionViewBtn(index: self.contentScrollView.contentOffset.x / XHScreenW)
  }
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    ///热点
    self.hotSpotWidth.constant = XHScreenW
    self.scrollViewContentSizeWidth.constant = XHScreenW * 12
    ///视频
    self.videoLeft.constant = XHScreenW
    self.videoRight.constant = XHScreenW * 10
    ///直播
    self.liveRight.constant = XHScreenW * 9
    ///行业
    self.businessRight.constant = XHScreenW * 8
    ///评测
    self.evaluatingLeft.constant = XHScreenW * 4
    self.evaluatingRight.constant = XHScreenW * 7
    ///导购
    self.shoppingRight.constant = XHScreenW * 6
    ///新车
    self.newCarRight.constant = XHScreenW * 5
    ///用车
    self.useCarRight.constant = XHScreenW * 4
    ///文化
    self.cultureRight.constant = XHScreenW * 3
    ///游记
    self.travelRight.constant = XHScreenW * 2
    ///技术
    self.technologyRight.constant = XHScreenW
    
  }
  
  //#MARK: - Lazy Loading View -
  
  lazy var customNavgation: WTSNewsNavgationTitleView = {
    let customNavgation: WTSNewsNavgationTitleView = WTSNewsNavgationTitleView(frame: CGRect(x: 0, y: 0, width: swiftScaleWidth_iPhone6(num: XHScreenW - XHScreenW * 0.145), height: 30))
    weak var weakself = self
    customNavgation.cellBtnBlock = { (tag: CGFloat) in
      weakself?.settingScrollViewOffset(offset: (tag - 1000))
    }
    return customNavgation
  }()
  
}
//#MARK: - Private Method -
extension WTSRootVC {
  fileprivate func settingNavgationBar() {
    self.isHeroEnabled = true
    self.navigationController?.navigationBar.barTintColor = UIColor.red
    self.navgationItem.titleView = self.customNavgation
    self.automaticallyAdjustsScrollViewInsets = false
    self.navigationController?.navigationBar.isTranslucent = false
    self.contentScrollView.delegate = self
    
    let searchBtn = UIButton(type: .custom)
    searchBtn.setImage(UIImage(named: "search_btn"), for: .normal)
    searchBtn.sizeToFit()
    searchBtn.heroID = "search"
    searchBtn.addTarget(for: .touchUpInside) { (_) in
      let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "searchController") as! WTSSearchViewController
      searchVC.transitioningDelegate = self
      searchVC.modalPresentationStyle = .fullScreen
      self.present(searchVC, animated: true) {
        
      }
    }
    let searchBarItem:UIBarButtonItem = UIBarButtonItem(customView: searchBtn)
    self.navgationItem.rightBarButtonItem = searchBarItem
    
  }
  
  fileprivate func settingScrollViewOffset(offset: CGFloat) {
    self.contentScrollView.setContentOffset(CGPoint(x: XHScreenW * offset, y: self.contentScrollView.contentOffset.y), animated: true)

//    print("偏移距离:\(self.customNavgation.swiftWidth() / (swiftScaleWidth_iPhone6(num: 40) * offset))")
    if (self.customNavgation.swiftWidth() / (swiftScaleWidth_iPhone6(num: 40) * offset)) < 1.3 {
      self.customNavgation.collectionTitleView.setContentOffset(CGPoint(x: (self.customNavgation.collectionTitleView.contentSize.width - self.customNavgation.swiftWidth()), y: self.customNavgation.collectionTitleView.contentOffset.y), animated: true)
      isCollectionTitleViewEnable = true
    } else if (self.customNavgation.swiftWidth() / (swiftScaleWidth_iPhone6(num: 40) * offset)) > 1.1 {
      if isCollectionTitleViewEnable {
        self.customNavgation.collectionTitleView.setContentOffset(CGPoint(x: 0, y: self.customNavgation.collectionTitleView.contentOffset.y), animated: true)
        isCollectionTitleViewEnable = false
      }
    }
    
  }
  
  fileprivate func settingCustomNavgationOffset(scrollView: UIScrollView) {
    if self.customNavgation.swiftWidth() / (swiftScaleWidth_iPhone6(num: 40) * (scrollView.contentOffset.x / XHScreenW)) < 1.4 {
      //      print("该往左滚动了...")
      self.customNavgation.collectionTitleView.setContentOffset(CGPoint(x: self.customNavgation.collectionTitleView.contentSize.width - self.customNavgation.swiftWidth(), y: self.customNavgation.collectionTitleView.swiftY()), animated: true)
      isScrollEnable = true
    } else if self.customNavgation.swiftWidth() / (swiftScaleWidth_iPhone6(num: 40) * (scrollView.contentOffset.x / XHScreenW)) > 1.1 {
      if isScrollEnable {
        //        print("该往右滑动了...")
        self.customNavgation.collectionTitleView.setContentOffset(CGPoint(x: 0, y: self.customNavgation.collectionTitleView.swiftY()), animated: true)
        isScrollEnable = false
      }
    }
  }
  
}
//#MARK: - Delegate -
extension WTSRootVC {
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    self.customNavgation.settingCollectionViewBtn(index: scrollView.contentOffset.x / XHScreenW)
//    print("开始偏移:\(self.customNavgation.swiftWidth() / (swiftScaleWidth_iPhone6(num: 40) * (scrollView.contentOffset.x / XHScreenW)))")
    self.settingCustomNavgationOffset(scrollView: scrollView)
  }
}

// MARK: - Transitioning Animation -
extension WTSRootVC {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let animationController:LOTAnimationTransitionController = LOTAnimationTransitionController(animationNamed: "vcTransition1", fromLayerNamed: "outLayer", toLayerNamed: "inLayer", applyAnimationTransform: false)
    
    return animationController
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let animationController:LOTAnimationTransitionController = LOTAnimationTransitionController(animationNamed: "vcTransition2", fromLayerNamed: "outLayer", toLayerNamed: "inLayer", applyAnimationTransform: false)
    
    return animationController
  }
  
}


