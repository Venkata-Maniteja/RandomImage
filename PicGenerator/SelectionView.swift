//
//  SelectionView.swift
//  PicGenerator
//
//  Created by Venkata Maniteja on 2017-06-07.
//  Copyright © 2017 VenkataNandamuri. All rights reserved.
//

import UIKit

class SelectionView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawSelectionFrame(frame: rect)
    }
 
    
    func drawSelectionFrame(frame: CGRect) {
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: frame.minX + floor(frame.width * 0.04525 + 0.5), y: frame.minY + floor(frame.height * 0.06494 + 0.5), width: floor(frame.width * 0.95475 + 0.5) - floor(frame.width * 0.04525 + 0.5), height: floor(frame.height * 0.93506 + 0.5) - floor(frame.height * 0.06494 + 0.5)))
        UIColor.blue.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()
        
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + floor((frame.width - 10) * 0.02370 + 0.5), y: frame.minY + floor((frame.height - 10) * 0.04167 + 0.5), width: 10, height: 10))
        UIColor.blue.setFill()
        ovalPath.fill()
        
        
        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + floor((frame.width - 10) * 0.02370 + 0.5), y: frame.minY + floor((frame.height - 10) * 0.95833 + 0.5), width: 10, height: 10))
        UIColor.blue.setFill()
        oval2Path.fill()
        
        
        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + floor((frame.width - 10) * 0.97630 + 0.5), y: frame.minY + floor((frame.height - 10) * 0.95833 + 0.5), width: 10, height: 10))
        UIColor.blue.setFill()
        oval3Path.fill()
        
        
        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + floor((frame.width - 10) * 0.97630 + 0.5), y: frame.minY + floor((frame.height - 10) * 0.04167 + 0.5), width: 10, height: 10))
        UIColor.blue.setFill()
        oval4Path.fill()
    }
    

}
