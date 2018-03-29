//
//  EUColors.swift
//  EuanTimer
//
//  Created by Sergii Frost on 2018-03-29.
//  Copyright © 2018 Frost°. All rights reserved.
//

import UIKit

fileprivate prefix func ~(value: CGFloat) -> CGFloat {
    return value / 255.0
}

extension UIColor {
    
    static func euGreenColor() -> UIColor {
        //#64DD17 Material: LightGreen A700
        return UIColor(red: ~100, green: ~221, blue: ~23, alpha: 1)
    }
    
    static func euRedColor() -> UIColor {
        //#E53935 Material: Red 600
        return UIColor(red: ~229, green: ~57, blue: ~53, alpha: 1)
    }
    
    static func euCyanColor() -> UIColor {
        //#4DD0E1 Material: Cyan 300
        return UIColor(red: ~77, green: ~208, blue: ~225, alpha: 1)
    }

    static func euBackgroundColor() -> UIColor {
        //#263238 Material: Blue Grey 900
        return UIColor(red: ~38, green: ~50, blue: ~56, alpha: 1)
    }
    
    static func euBlueGreyColor() -> UIColor {
        //#90A4AE Material: Blue Grey 300
        return UIColor(red: ~144, green: ~164, blue: ~174, alpha: 1)
    }

}
