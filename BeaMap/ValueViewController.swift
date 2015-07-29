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
    var value:String!
    var keyboardType:UIKeyboardType = UIKeyboardType.Default
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        loadValue()
    }
    
    override func viewWillAppear(animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        saveUserDefaults()
        textField.resignFirstResponder()
    }
    
    func loadValue() {
        textField.placeholder = placeholder
        textField.text = value
        textField.keyboardType = keyboardType
    }
    
    func saveUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if !textField.text.isEmpty {
            defaults.setObject(textField.text, forKey: self.title!)
            defaults.synchronize()
        }
    }
}
