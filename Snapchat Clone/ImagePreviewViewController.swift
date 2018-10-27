//
//  ImagePreviewViewController.swift
//  Snapchat Clone
//
//  Created by Christine Luo on 10/26/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var selectedSnap: Snap!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let s = selectedSnap {
            image.image = s.image
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dismissImageView(gestureRecognizer: UITapGestureRecognizer) {
        self.image.removeFromSuperview()
    }
}
