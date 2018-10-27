//
//  TabBarViewController.swift
//  Snapchat Clone
//
//  Created by Christine Luo on 10/22/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor.yellow
        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.gray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
