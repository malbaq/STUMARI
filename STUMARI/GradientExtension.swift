//
//  GradientExtension.swift
//  STUMARI
//
//  Created by Tom Malary on 11/27/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

extension CAGradientLayer  {
    
    func maskForCell(fromWhiteToBlack: Bool) -> CAGradientLayer {
        
        let blackColor = UIColor(white: 0, alpha: 0.7)
        
        let whiteColor = UIColor(white: 200, alpha: 0)
        
        var topColor: UIColor
        
        var bottomColor: UIColor
        
        if fromWhiteToBlack == true {
            topColor = whiteColor
            bottomColor = blackColor
        } else {
            topColor = blackColor
            bottomColor = whiteColor
        }
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
 
    }

}
