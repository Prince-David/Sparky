//
//  WelcomeViewController.swift
//  Sparky
//
//  Created by DAVID MAIMAN on 3/12/16.
//  Copyright © 2016 TeamSparky. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome"
        
        self.navigationItem.hidesBackButton = true

    }
    @IBAction func openProvider(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        self.navigationItem.hidesBackButton = true
        let dash : DashboardViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Dashboard") as! DashboardViewController
        
        let navigationController = UINavigationController(rootViewController: dash)
        navigationController.navigationBar.backgroundColor = self.navigationController?.navigationBar.backgroundColor
        
        
        self.navigationController?.pushViewController(dash, animated: true)
    }
    @IBAction func meetAction(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        self.navigationItem.hidesBackButton = true
        let meetView : MeetViewController = mainStoryboard.instantiateViewControllerWithIdentifier("doctorsPage") as! MeetViewController
        
//        let navigationController = UINavigationController(rootViewController: meetView)
//        navigationController.navigationBar.backgroundColor = self.navigationController?.navigationBar.backgroundColor
//        navigationController.navigationBar.tintColor = UIColor.whiteColor()
//        navigationController.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName:UIColor.whiteColor()]

        self.navigationController?.pushViewController(meetView, animated: true)
    }
    @IBAction func planAction(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        self.navigationItem.hidesBackButton = true
        let planDay : PlanDayViewController = mainStoryboard.instantiateViewControllerWithIdentifier("planday") as! PlanDayViewController
        
        let navigationController = UINavigationController(rootViewController: planDay)
        navigationController.navigationBar.backgroundColor = self.navigationController?.navigationBar.backgroundColor

        
        self.navigationController?.pushViewController(planDay, animated: true)
    }
    @IBAction func playAction(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        self.navigationItem.hidesBackButton = true
        let selfie : SelfieViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SelfieView") as! SelfieViewController
        
        let navigationController = UINavigationController(rootViewController: selfie)
        navigationController.navigationBar.backgroundColor = self.navigationController?.navigationBar.backgroundColor
        
        
        self.navigationController?.pushViewController(selfie, animated: true)
    }
    
}