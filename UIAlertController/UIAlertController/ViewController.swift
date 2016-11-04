//
//  ViewController.swift
//  UIAlertController
//
//  Created by zhangyongjun on 16/5/25.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let alertC = MyAlertController.init(title: "提示", message: "提示信息", preferredStyle: .alert)
        let defaultAct = UIAlertAction.init(title: "Default", style: .default) { (_) in
            print("clickOnDefault")
        }
        alertC.addAction(defaultAct)
        
        let destructiveAct = UIAlertAction.init(title: "Destructive", style: .destructive) { (_) in
            print("clickOnDestructive")
        }
        alertC.addAction(destructiveAct)
        
        let cancelAct = UIAlertAction.init(title: "Cancel", style: .cancel) { (_) in
            print("clickOnCancel")
        }
        alertC.addAction(cancelAct)
        
        //修改title
        let attrTitle = NSMutableAttributedString.init(string: "提示")
        attrTitle.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(0, 2))
        attrTitle.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 15), range: NSMakeRange(0, 2))
        alertC.setValue(attrTitle, forKey: "attributedTitle")
        
        //修改message
        let attrMessage = NSMutableAttributedString.init(string: "提示信息")
        attrMessage.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 13), range: NSMakeRange(0, 4))
        attrMessage.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range: NSMakeRange(0, 4))
        alertC.setValue(attrMessage, forKey: "attributedMessage")
        
        cancelAct.setValue(UIColor.purple, forKey: "titleTextColor")
        
        self.present(alertC, animated: true, completion: nil)
    }

}

