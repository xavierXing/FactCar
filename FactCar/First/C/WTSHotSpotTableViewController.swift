//
//  WTSHotSpotTableViewController.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/7.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class WTSHotSpotTableViewController: UITableViewController {

  let reuseIdentifier: String = "reuseIdentifier"
  
  @IBOutlet weak var titleView: UINavigationItem!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.settingNavgationView()
//    let titleView = WTSNewsNavgationTitleView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
//    self.titleView.titleView = titleView
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
    }
    return cell!
  }

  //#MARK: - Lazy Loading View -
  lazy var collectionTitleView: WTSNewsNavgationTitleView = {
    let titleView : WTSNewsNavgationTitleView = WTSNewsNavgationTitleView(frame: CGRect(x: 0, y: 0, width:swiftScaleWidth_iPhone6(num: XHScreenW - XHScreenW * 0.145) , height: 30))
    return titleView
  }()
  
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//#MARK: - Private Method -
extension WTSHotSpotTableViewController {
  fileprivate func settingNavgationView() -> Void {
    self.titleView.titleView = self.collectionTitleView
  }
}

