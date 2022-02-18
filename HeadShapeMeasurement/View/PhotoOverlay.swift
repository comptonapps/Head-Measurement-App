//
//  GridOverlay.swift
//  HeadShapeMeasurement
//
//  Created by Jonathan Compton on 9/28/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit

class PhotoOverlay: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clear
    }


    override func draw(_ rect: CGRect) {
        drawCrosshairs()
        drawGridLines()
        if StateManager.shared.plagiocephaly {
            draw30DegreeLines()
        }
        
    }
    
    func drawCrosshairs() {
        drawLine(begin: .init(x: bounds.width / 2 - 1, y: 0), end: .init(x: bounds.width / 2 - 1 , y: bounds.height), color: UIColor.red, width: 3)
        drawLine(begin: .init(x: 0, y: bounds.height / 2 - 1), end: .init(x: bounds.width, y: bounds.height / 2 - 1), color: UIColor.red, width: 3)
    }
    
    func drawGridLines() {
        var x : CGFloat = bounds.width / 2 + 50
        var y : CGFloat = bounds.height / 2 + 50
        while x < bounds.width {
            drawLine(begin: .init(x: x, y: 0), end: .init(x: x, y: bounds.height), color: UIColor.black, width: 1)
            x += 50
        }
        x = bounds.width / 2 - 50
        while x > 0 {
            drawLine(begin: .init(x: x, y: 0), end: .init(x: x, y: bounds.height), color: UIColor.black, width: 1)
            x -= 50
        }
        while y < bounds.height {
            drawLine(begin: .init(x: 0, y: y), end: .init(x: bounds.width, y: y), color: UIColor.black, width: 1)
            y += 50
        }
        y = bounds.height / 2 - 50
        while y > 0 {
            drawLine(begin: .init(x: 0, y: y), end: .init(x: bounds.width, y: y), color: UIColor.black, width: 1)
            y -= 50
        }
        
        
    }
    
    func draw30DegreeLines() {
        let centerPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let deltaY = bounds.width / 2 * tan(1.0472)
        drawLine(begin: centerPoint, end: CGPoint(x: bounds.width, y: centerPoint.y + deltaY), color: .red, width: 3)
        print(bounds.width/2)
        drawLine(begin: centerPoint, end: CGPoint(x: bounds.width, y: centerPoint.y - deltaY), color: UIColor.red, width: 3)
        drawLine(begin: centerPoint, end: CGPoint(x: 0, y: centerPoint.y - deltaY), color: UIColor.red, width: 3)
        drawLine(begin: centerPoint, end: CGPoint(x: 0, y: centerPoint.y + deltaY), color: UIColor.red, width: 3)
    }
    
    
    func drawLine(begin: CGPoint, end: CGPoint, color: UIColor , width: CGFloat) {
        let path = UIBezierPath()
        path.move(to: begin)
        path.addLine(to: end)
        color.setStroke()
        path.lineWidth = width
        path.stroke(with: .color, alpha: 0.5)
        path.fill(with: .color, alpha: 0.5)
    }


}
