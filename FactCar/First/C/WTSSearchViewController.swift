//
//  WTSSearchViewController.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/25.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSSearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  @IBOutlet weak var searchTextField: UITextField!

  @IBOutlet weak var searchContentTableView: UITableView!
  
  @IBAction func searchAction(_ sender: Any) {
    self.dismiss(animated: true) {

    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.registerNib()
    

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WTSSearchViewController {
  fileprivate func registerNib() {
      self.searchContentTableView.register(UINib(nibName: "WTSSearchHeaderViewTableViewCell", bundle: nil), forCellReuseIdentifier: "searchHeaderView")
  }
}

extension WTSSearchViewController {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell = tableView.dequeueReusableCell(withIdentifier: "searchHeaderView")
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell.init(style: .default, reuseIdentifier: "just")
    cell.backgroundColor = UIColor.red
    return cell
  }

  
}


