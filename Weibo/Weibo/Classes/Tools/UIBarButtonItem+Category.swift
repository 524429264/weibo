//
//  UIBarButtonItem+Category.swift
//  Weibo
//
//  Created by nsky on 16/4/15.
//  Copyright © 2016年 nsky. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func createBarButtonItem(imageName:String, target:AnyObject?, action:Selector) -> UIBarButtonItem {
        let btn = UIButton()
//        btn.sizeToFit()

        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)                          
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView: btn)
        
    }

}
