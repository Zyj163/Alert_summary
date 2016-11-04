//
//  MyAlertController.swift
//  UIAlertController
//
//  Created by zhangyongjun on 16/5/25.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class MyAlertController: UIAlertController {

    deinit {
        print("dealloc")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let actionViews = view.value(forKeyPath: "actionViews") else {
            print("cannot find actionViews")
            return
        }
        for actionView in actionViews as! Array<UIView>{
            actionView.addObserver(self, forKeyPath: "highlighted", options: .new, context: nil)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let actionViews = view.value(forKeyPath: "actionViews") else {
            print("cannot find actionViews")
            return
        }
        for actionView in actionViews as! Array<UIView>{
            actionView.removeObserver(self, forKeyPath: "highlighted")
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "highlighted" {
            let hi = change!["new"] as! Bool
            if let label : UILabel? = (object as AnyObject).value(forKeyPath: "label") as? UILabel {
                label?.textColor = hi ? UIColor.white : nil
                label?.tintColor = hi ? UIColor.white : nil
            }
        }
    }

}
