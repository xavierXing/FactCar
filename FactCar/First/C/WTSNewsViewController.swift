//
//  WTSNewsViewController.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/7.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSNewsViewController: UINavigationController {
  let hotSpot: WTSHotSpotTableViewController = WTSHotSpotTableViewController()
  // #MARK: - life circle -
  
  /* 1.视图控制器中的视图加载完成，viewController自带的view加载完成 */
  override func viewDidLoad() {
    super.viewDidLoad()
//    self.settingContentView()
//    self.settingChildren()
  }
  /* 2.视图将要出现 */
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  /* 3.View即将布局Subviews */
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
  }
  /* 4.View已经布局Subviews */
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  /* 5.视图已经出现 */
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  /* 6.视图将要消失 */
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  /* 7.视图已经消失 */
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  /* 8.视图被销毁 */
  deinit {
    
  }
  
  // #MARK: - Lazy Loading Model -
  
  // #MARK: - Lazy Loading View -
  lazy var contentScrollView: UIScrollView = {
    let scrollView:UIScrollView = UIScrollView(frame: UIScreen.main.bounds)
    scrollView.backgroundColor = UIColor.green
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 12, height: UIScreen.main.bounds.height)
    return scrollView
  }()
  
}

// #MARK: - Public Method -
extension WTSNewsViewController {
  
}

// #MARK: - Private Method -
extension WTSNewsViewController {
  fileprivate func settingContentView() -> Void {
    self.view.addSubview(self.contentScrollView)
  }
  
  fileprivate func settingChildren() -> Void {
    self.addChildViewController(self.hotSpot)
    
  }
}

// #MARK: - Delegate -
extension WTSNewsViewController {
  
}

// #MARK: - Event -
extension WTSNewsViewController {
  
}

// #MARK: - CallBack -
extension WTSNewsViewController {
  
}

