//
//  Brick.swift
//  banco
//
//  Created by Ngoduc on 2/18/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class Brick: UIView {
    var squareLayer: CAShapeLayer!
       var radius: CGFloat = 0.0
       var fillColor: UIColor!
       
       convenience init(startPoint: CGPoint, radius: CGFloat, fillColor: UIColor) {
           self.init(frame: CGRect(x: startPoint.x, y: startPoint.y, width: radius * 2.0, height: radius * 2.0))
           self.radius = radius
           self.fillColor = fillColor
       }
       
       override func draw(_ rect: CGRect) {
           if squareLayer == nil {
               squareLayer = CAShapeLayer()
               squareLayer.path = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height), cornerRadius: 0).cgPath
               
               squareLayer.fillColor = fillColor.cgColor
               self.layer.addSublayer(squareLayer)
               
               // kích thước squareView
               let L = self.frame.size.width
               // x = 1/10L là đoạn kích thước thụt vào
               let x = L / 10
               
               
           }
       }

}
