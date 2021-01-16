//
//  UIApplication.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit

extension UIApplication{
    class func getPresentedViewController() -> UIViewController? {
        
        var presentViewController = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentViewController?.presentedViewController
        {
            presentViewController = pVC
        }
        return presentViewController
    }
}
