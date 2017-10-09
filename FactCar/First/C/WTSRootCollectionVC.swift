//
//  WTSRootCollectionVC.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/28.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit
import Lottie

private let reuseIdentifier = "Cell"

class WTSRootCollectionVC: UICollectionViewController, UIViewControllerTransitioningDelegate {
  /// content
  let reuseIdentifierArray = ["HotSpotCell", "VideoCell", "LiveCell", "BusinessCell", "EvaluatingCell", "ShoppingCell", "NewCarCell", "UseCarCell", "CaltureCell", "TravelCell", "TechnologyCell", "MarketCell"]
  var rootTitle: WTSRootTitleView?

  @IBOutlet var rootContent: UICollectionView!

    @IBOutlet weak var titleContent: UIView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    self.settingNavgationBar()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }

  // MARK: - UICollectionViewDataSource -
  override func numberOfSections(in collectionView: UICollectionView) -> Int {

    return 1

  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return 12
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierArray[indexPath.row], for: indexPath)

    return cell

  }

}
// MARK: - Private Method -
extension WTSRootCollectionVC {
  fileprivate func settingNavgationBar() {
    let searchBtn = UIButton(type: .custom)
    searchBtn.setImage(UIImage(named: "search_btn"), for: .normal)
    searchBtn.sizeToFit()
    searchBtn.addTarget(for: .touchUpInside) { _ in
      let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "searchController") as! WTSSearchViewController
      searchVC.transitioningDelegate = self
      searchVC.modalPresentationStyle = .fullScreen
      self.present(searchVC, animated: true) {

      }
    }
    let searchBarItem: UIBarButtonItem = UIBarButtonItem(customView: searchBtn)
    self.navigationItem.rightBarButtonItem = searchBarItem
    rootTitle = self.navigationItem.titleView?.subviews.last as? WTSRootTitleView
    rootTitle?.clickIndexBlock = { index in
      self.autoIndexContent(index: index)
    }
    
  }
    

  func autoIndexContent(index: Int) {
    self.rootContent.setContentOffset(CGPoint(x: CGFloat(index) * XHScreenW, y: 0), animated: true)

  }

}
// MARK: - UIScrollViewDelegate -
extension WTSRootCollectionVC {

  override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    rootTitle?.autoIndex(index: Int(scrollView.contentOffset.x / XHScreenW))
  }

}

// MARK: - Transitioning Animation -
extension WTSRootCollectionVC {

  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let animationController: LOTAnimationTransitionController = LOTAnimationTransitionController(animationNamed: "vcTransition1", fromLayerNamed: "outLayer", toLayerNamed: "inLayer", applyAnimationTransform: false)
    
    return animationController
  }

  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let animationController: LOTAnimationTransitionController = LOTAnimationTransitionController(animationNamed: "vcTransition2", fromLayerNamed: "outLayer", toLayerNamed: "inLayer", applyAnimationTransform: false)

    return animationController
  }

}
