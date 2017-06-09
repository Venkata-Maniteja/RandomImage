//
//  SelectionView.swift
//  PicGenerator
//
//  Created by Venkata Maniteja on 2017-06-07.
//  Copyright © 2017 VenkataNandamuri. All rights reserved.
//

import UIKit

class SelectionView: UIView {
    
    var topLeftPoint:CGPoint?
    var topRightPoint:CGPoint?
    var bottomRightPoint:CGPoint?
    var bottomLeftPoint:CGPoint?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawSelectionFrame(frame: rect)
    }
    
    
    convenience init(frame:CGRect, pt1:CGPoint,pt2:CGPoint,pt3:CGPoint,pt4:CGPoint){
        
        self.init(frame: frame)
        
        self.topLeftPoint=pt1
        self.topRightPoint=pt2
        self.bottomLeftPoint=pt3
        self.bottomRightPoint=pt4
    }
 
    
    func drawSelectionFrame(frame: CGRect) {
        
        //// Frames
        let bottomRightTouchOffsetFrame = CGRect(x: bottomRightPoint!.x, y: bottomRightPoint!.y, width: 25, height: 25)
        let topRightTouchOffsetFrame = CGRect(x: topRightPoint!.x, y: topRightPoint!.y, width: 25, height: 25)
        let bottomLeftTouchOffsetFrame = CGRect(x: bottomLeftPoint!.x, y: bottomLeftPoint!.y, width: 25, height: 25)
        let topLeftTouchOffsetFrame = CGRect(x: topLeftPoint!.x, y: topLeftPoint!.y, width: 25, height: 25)
        
        
        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalIn: CGRect(x: bottomRightTouchOffsetFrame.minX + floor((bottomRightTouchOffsetFrame.width )), y: bottomRightTouchOffsetFrame.minY + floor((bottomRightTouchOffsetFrame.height )), width: 10, height: 10))
        UIColor.blue.setFill()
        oval4Path.fill()
        
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: topLeftTouchOffsetFrame.minX + topLeftTouchOffsetFrame.width, y: topLeftTouchOffsetFrame.minY + topLeftTouchOffsetFrame.height))
        bezierPath.addLine(to: CGPoint(x: topRightTouchOffsetFrame.minX +  topRightTouchOffsetFrame.width, y: topRightTouchOffsetFrame.minY +  topRightTouchOffsetFrame.height))
        bezierPath.addLine(to: CGPoint(x: bottomRightTouchOffsetFrame.minX +  bottomRightTouchOffsetFrame.width, y: bottomRightTouchOffsetFrame.minY +  bottomRightTouchOffsetFrame.height))
        bezierPath.addLine(to: CGPoint(x: bottomLeftTouchOffsetFrame.minX +  bottomLeftTouchOffsetFrame.width, y: bottomLeftTouchOffsetFrame.minY +  bottomLeftTouchOffsetFrame.height))
        bezierPath.addLine(to: CGPoint(x: topLeftTouchOffsetFrame.minX +  topLeftTouchOffsetFrame.width, y: topLeftTouchOffsetFrame.minY +  topLeftTouchOffsetFrame.height))
        bezierPath.close()
        UIColor.blue.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: topRightTouchOffsetFrame.minX + floor((topRightTouchOffsetFrame.width ) ), y: topRightTouchOffsetFrame.minY + floor((topRightTouchOffsetFrame.height) ), width: 10, height: 10))
        UIColor.blue.setFill()
        ovalPath.fill()
        
        
        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: bottomLeftTouchOffsetFrame.minX + floor((bottomLeftTouchOffsetFrame.width) ), y: bottomLeftTouchOffsetFrame.minY + floor((bottomLeftTouchOffsetFrame.height) ), width: 10, height: 10))
        UIColor.blue.setFill()
        oval2Path.fill()
        
        
        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: topLeftTouchOffsetFrame.minX + floor((topLeftTouchOffsetFrame.width) ), y: topLeftTouchOffsetFrame.minY + floor((topLeftTouchOffsetFrame.height) ), width: 10, height: 10))
        UIColor.blue.setFill()
        oval3Path.fill()
    }
    
    

}
