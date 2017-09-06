//
//  SearchContentVC.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/5.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class SearchContentVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

  @IBOutlet weak var searchTextField: UITextField!
  
  @IBOutlet weak var chooseCollectionView: UICollectionView!
  
  @IBOutlet weak var contentCollectionView: UICollectionView!
  
  let chooseCollectSource:[String]! = ["文章","车型","视频"]
  var index:Int? = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("2222")
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
      let chooseTitleLabel:UILabel = cell.viewWithTag(2) as! UILabel
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
// MARK: - Private Method -
extension SearchContentVC {
   fileprivate func settingContentCollectionViewOffset(index: Int) -> Void {
    self.contentCollectionView.setContentOffset(CGPoint(x: CGFloat(index) * XHScreenW, y: 0), animated: true)
  }
}
