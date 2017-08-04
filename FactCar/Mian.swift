//
//  Mian.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/4.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class Mian: UITabBarController {

  @IBOutlet weak var MainTabbar: UITabBar!
    //#MARK: - life circle -
  
    /*1.视图控制器中的视图加载完成，viewController自带的view加载完成*/
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange;
      self.MainTabbar.tintColor = UIColor.red
    }
    /*2.视图将要出现*/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    /*3.View即将布局Subviews*/
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    /*4.View已经布局Subviews*/
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    /*5.视图已经出现*/
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    /*6.视图将要消失*/
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    /*7.视图已经消失*/
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    /*8.视图被销毁*/
    deinit {
        
    }
  
  //#MARK: - Lazy Loading Model -
  
  //#MARK: - Lazy Loading View -
  
  
}

//#MARK: - Public Method -
extension Mian {
    
}

//#MARK: - Private Method -
extension Mian {
    
}

//#MARK: - Delegate -
extension Mian {
    
}

//#MARK: - Event -
extension Mian {
    
}

//#MARK: - CallBack -
extension Mian {
    
}


