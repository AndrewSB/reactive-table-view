//
//  UIColorExtension.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/9/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
     Get Random Color by generating three random float to represent RGB
     **/
    class func randomColor() -> UIColor{
        
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}
