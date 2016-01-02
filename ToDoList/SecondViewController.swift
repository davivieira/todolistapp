//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Davi Vieira on 01/01/16.
//  Copyright © 2016 Davi Albuquerque Vieira. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet var textField: UITextField!
  
  @IBAction func saveItem(sender: AnyObject) {
    let firstViewController:FirstViewController = FirstViewController()
    var tableContent = firstViewController.getLastUpdatedList()
    
    if (textField.text != nil) {
      tableContent.append(textField.text!)
    }
    
    firstViewController.updateList(tableContent)
    textField.text = nil
    
    let tabBarController = self.parentViewController as! UITabBarController
    tabBarController.selectedIndex = 0
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }


}

