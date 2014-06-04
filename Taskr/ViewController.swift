//
//  ViewController.swift
//  Taskr
//
//  Created by David Becerra on 6/3/14.
//  Copyright (c) 2014 Creative Drift Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
  var tableView: UITableView!
  var textField: UITextField!
  var tableViewData = String[]()
  
  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup tableView
    
    self.tableView = UITableView(frame: CGRectMake(0, 75, self.view.bounds.size.width,
      self.view.bounds.size.height - 75), style: UITableViewStyle.Plain)
    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    
    self.view.addSubview(self.tableView)
    
    // Setup textField
    
    self.textField = UITextField(frame: CGRectMake(0, 0, self.view.bounds.size.width, 75))
    self.textField.backgroundColor = UIColor.brownColor()
    
    self.textField.delegate = self
    
    self.view.addSubview(self.textField)
    
  }
  
  // UITableViewDataSource
  
  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return tableViewData.count
  }
  
  func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    let myNewCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
    
    myNewCell.text = self.tableViewData[indexPath.row]
    
    return myNewCell
  }
  
  // Return text field
  
  func textFieldShouldReturn(textField: UITextField!) -> Bool {
    tableViewData.append(textField.text)
    textField.text = ""
    self.tableView.reloadData()
    textField.resignFirstResponder()
    return true
  }

}
