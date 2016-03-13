//
//  DoctorDetail.swift
//  Sparky
//
//  Created by DAVID MAIMAN on 3/13/16.
//  Copyright © 2016 TeamSparky. All rights reserved.
//

import UIKit

class DoctorDetailViewController: UIViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        self.title = "Dr. Sarah Arthur"
        self.navigationItem.hidesBackButton = true
        
    }
}