//
//  CustomTableViewCell.swift
//  ToDoList
//
//  Created by Davi Vieira on 01/01/16.
//  Copyright © 2016 Davi Albuquerque Vieira. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  @IBOutlet var content: UILabel!
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }

}
