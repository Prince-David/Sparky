//
//  ViewController.swift
//  Sparky
//
//  Created by DAVID MAIMAN on 3/12/16.
//  Copyright © 2016 TeamSparky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogTest: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup afte r loading the view, typically from a nib.
        var imgListArray :[UIImage] = []
        for countValue in 0...6
        {
            
            var strImageName : String = "dalmation-\(countValue).gif"
            var image  = UIImage(named:strImageName)
            if image != nil{
            imgListArray.append(image!)
            }
        }
        
        self.dogTest.animationImages = imgListArray;
        self.dogTest.animationDuration = 1.0
        self.dogTest.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

