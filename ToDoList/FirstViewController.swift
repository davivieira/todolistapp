//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Davi Vieira on 01/01/16.
//  Copyright © 2016 Davi Albuquerque Vieira. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet var tableViewList: UITableView!
  var indexToDelete:NSIndexPath? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableContent = getLastUpdatedList()
    
    if tableContent.isEmpty {
      updateList(tableContent)
    }
  }
  
  override func viewDidAppear(animated: Bool) {
    tableViewList.reloadData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let tableContent = getLastUpdatedList()

    
    return tableContent.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
    let tableContent = getLastUpdatedList()
    
    cell.content.text = "\(tableContent[indexPath.row])"
    
    return cell
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    let tableContent = getLastUpdatedList()
    
    if editingStyle == .Delete {
      indexToDelete = indexPath
      let item = tableContent[indexPath.row]
      confirmDelete("\(item)")
    }
  }
  
  func confirmDelete(item: String) {
    let alert = UIAlertController(title: "Delete item", message: "Are you sure you want to permanently delete \(item)?", preferredStyle: .ActionSheet)
    
    let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDelete)
    let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDelete)
    
    alert.addAction(DeleteAction)
    alert.addAction(CancelAction)
    
    // Support display in iPad
    alert.popoverPresentationController?.sourceView = self.view
    alert.popoverPresentationController?.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
    
    self.presentViewController(alert, animated: true, completion: nil)
  }
  
  func handleDelete(alertAction: UIAlertAction!) -> Void {
    if let indexPath = indexToDelete {
      var tableContent = getLastUpdatedList()
      
      tableViewList.beginUpdates()
      
      tableContent.removeAtIndex(indexPath.row)
      updateList(tableContent)
      
      // Note that indexPath is wrapped in an array:  [indexPath]
      tableViewList.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      
      indexToDelete = nil
      
      tableViewList.endUpdates()
    }
  }
  
  func cancelDelete(alertAction: UIAlertAction!) {
    indexToDelete = nil
  }
  
  func getLastUpdatedList() -> [AnyObject] {
    return NSUserDefaults.standardUserDefaults().arrayForKey("list")!
  }
  
  func updateList(newListContents:[AnyObject]) {
    NSUserDefaults.standardUserDefaults().setObject(newListContents, forKey: "list")
  }
}



