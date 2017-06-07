//
//  ViewController.swift
//  PicGenerator
//
//  Created by Venkata Maniteja on 2017-06-07.
//  Copyright © 2017 VenkataNandamuri. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //The view used to select the imageview size
    var selectionView:SelectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addSelectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Init the custom view shape
    func addSelectionView(){
        selectionView = SelectionView()
        selectionView?.frame = CGRect(x:50,y:50,width:200,height:200)
        selectionView?.backgroundColor = UIColor.clear
        self.view.addSubview(selectionView!)
    }
    
    //touch delegate  methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    //corner detection methods
    func getCornersOfRectangle(rectangle:CGRect) -> [Array<CGPoint>]{
        
        var cornerArray = [Array<CGPoint>]()//array of (array of cgpoints)
        let rectOffset:Float = 30
        
        //Each corner is also a rectangle which contains 4 points.
        //points are added in top left,top right,bottom left,bottom right
        
        //top-left corner
        var topLeftCorner = [CGPoint]()
        topLeftCorner.append(CGPoint(x: 0, y: 0))
        topLeftCorner.append(CGPoint(x: Int(rectOffset), y: 0))
        topLeftCorner.append(CGPoint(x: 0, y: Int(rectOffset)))
        topLeftCorner.append(CGPoint(x: Int(rectOffset), y: Int(rectOffset)))
        cornerArray.append(topLeftCorner)
        
        //top-right corner
        var topRightCorner = [CGPoint]()
        topRightCorner.append(CGPoint(x: Int(Float(rectangle.width)-rectOffset), y: 0))
        topRightCorner.append(CGPoint(x: Int(rectOffset), y: 0))
        topRightCorner.append(CGPoint(x: 0, y: Int(rectOffset)))
        topRightCorner.append(CGPoint(x: Int(rectOffset), y: Int(rectOffset)))
        cornerArray.append(topRightCorner)
//        cornerArray.append(CGRect(x:1,y:1,width:1,height:1))
        //bottom-left corner
        var topLeftCorner = [CGPoint]()
        topLeftCorner.append(CGPoint(x: 0, y: 0))
        topLeftCorner.append(CGPoint(x: rectOffset, y: 0))
        topLeftCorner.append(CGPoint(x: 0, y: rectOffset))
        topLeftCorner.append(CGPoint(x: rectOffset, y: rectOffset))
        cornerArray.append(topLeftCorner)
//        cornerArray.append(CGRect(x:1,y:1,width:1,height:1))
        //bottom-right corner
//        cornerArray.append(CGRect(x:1,y:1,width:1,height:1))
        
        return cornerArray
    }


}

