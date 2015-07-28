//
//  ValueViewController.swift
//  BeaMap
//
//  Created by jerryz on 2015/7/28.
//  Copyright (c) 2015年 JerryZ. All rights reserved.
//

import UIKit

class ValueViewController: UITableViewController {
    var placeholder:String!
    var keyboardType:UIKeyboardType = UIKeyboardType.Default
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        textField.placeholder = placeholder
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if let value = NSUserDefaults.standardUserDefaults().stringForKey(self.title!) {
            textField.text = value
        }
        textField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        textField.resignFirstResponder()
    }
}
