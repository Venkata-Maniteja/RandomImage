//
//  ViewController.swift
//  PicGenerator
//
//  Created by Venkata Maniteja on 2017-06-07.
//  Copyright © 2017 VenkataNandamuri. All rights reserved.
//

import UIKit


class ViewController: UIViewController,URLSessionDelegate,URLSessionDataDelegate {
    
    //The view used to select the imageview size
    var selectionView:SelectionView?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    var imgURLArray:[URL]?
    var imgArray:[UIImage]?
    var animationOptionsArray:[UIViewAnimationOptions]?
    var imgTimer:Timer?
    var progressViewTimer:Timer?
    var progressValue: Float = 1.0
    var progressCounter: Int = 0
    var expectedContentLength = 0
    var buffer:NSMutableData = NSMutableData()
    var session:URLSession?
    var dataTask:URLSessionDataTask?
    var progressTime:Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressView.progress = 0.0
        addRandomImgURL()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startProgressTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRandomImgURL(){
        
        //Teh default image size is 300x300
        imgURLArray = [URL]()
        imgArray = [UIImage]()
        animationOptionsArray=[UIViewAnimationOptions]()
        animationOptionsArray?.append(UIViewAnimationOptions.transitionCurlUp)
        animationOptionsArray?.append(UIViewAnimationOptions.transitionCurlDown)
        animationOptionsArray?.append(UIViewAnimationOptions.transitionCrossDissolve)
        animationOptionsArray?.append(UIViewAnimationOptions.transitionFlipFromTop)
        animationOptionsArray?.append(UIViewAnimationOptions.transitionFlipFromRight)
        animationOptionsArray?.append(UIViewAnimationOptions.transitionFlipFromBottom)
        
        
        imgURLArray?.append(URL.init(string: "https://loremflickr.com/600/600")!)
        imgURLArray?.append(URL.init(string: "https://lorempixel.com/600/600/")!)
        
        startDownloading()
    }
    
    @objc func downloadImage(){
        
       let mainqueue = OperationQueue.main
        mainqueue.addOperation {
            URLSession.shared.dataTask(with: (self.imgURLArray?.randomItem())!) { (data, response, error) in
                guard let data = data, error == nil else { return }
                print("Download Finished")
                self.imgArray?.append(UIImage(data: data)!)
                
            }.resume()
        }
        
    }
    
    func startDownloading(){
        if let tempTimer = self.imgTimer{
            tempTimer.invalidate()
         }
        self.imgTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(downloadImage), userInfo: nil, repeats: true)
    }
    
    func startProgressTimer(){
        
        self.progressViewTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
        
    }
    
    func stopProgressTimer(){
        self.progressViewTimer?.invalidate()
    }
    
    func stopDownloading(){
        if let tempTimer = self.imgTimer{
            tempTimer.invalidate()
        }
    }
    
    @objc func setProgress() {
        print("progress time is \(progressTime)")
        progressTime += 0.01
        DispatchQueue.main.async() { () -> Void in
           self.progressView.setProgress(self.progressTime / 5, animated: false)
        }
        
        if progressTime > 5 {
            progressTime = 0
            //Load image form array into imageView
            DispatchQueue.main.async() { () -> Void in
                
                if let arrCount = self.imgArray?.count{
                    if arrCount > 0{
                        UIView.transition(with: self.imgView, duration: 1.0, options: (self.animationOptionsArray?.randomItem())!, animations: {
                             self.imgView.image=self.imgArray?.randomItem()
                        }, completion: nil)
                        
                    }
                }
            }
        }
    }
    
    
    //Init the custom view shape
    func addSelectionView(){

        let selViewRect:CGRect = CGRect(x:50,y:50,width:200,height:200)

        selectionView = SelectionView.init(frame:selViewRect ,pt1: CGPoint(x: selViewRect.origin
            .x, y: selViewRect.origin.y),pt2: CGPoint(x: selViewRect.width-25, y: selViewRect.origin.y),pt3: CGPoint(x: selViewRect.origin.x, y: selViewRect.height-25),pt4: CGPoint(x: selViewRect.width-25, y: selViewRect.height-25))
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
    
    


}

