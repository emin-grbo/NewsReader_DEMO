//
//  ImageView_customization.swift
//  NewsReader_demo
//
//  Created by Emin Roblack on 12/30/18.
//  Copyright © 2018 emiN Roblack. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

extension ViewController {
func customizeImageView(image: UIImageView){
  
let gradient = CAGradientLayer()

gradient.frame = image.frame
  
let colors = [
  UIColor(red: 0, green: 250/255, blue: 146/255, alpha: 1).cgColor,
  UIColor(red: 41/255, green: 43/255, blue: 53/255, alpha: 0.8).cgColor
]

gradient.startPoint = CGPoint(x: 0, y: 1)
gradient.endPoint = CGPoint(x: 0, y: 0.2)
  
gradient.colors = colors

image.layer.addSublayer(gradient)
  
}
}
