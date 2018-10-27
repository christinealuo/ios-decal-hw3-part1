//
//  Snap.swift
//  Snapchat Clone
//
//  Created by Christine Luo on 10/21/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snap {
    var readOrUnread: UIImage
    var image: UIImage
    var name: String
    var date: Date
    var feedPostedTo: String!
    
    init(readOrUnread: UIImage, image: UIImage, name:String, date: Date, feedPostedTo: String) {
        self.readOrUnread = readOrUnread
        self.image = image
        self.name = name
        self.date = date
        self.feedPostedTo = feedPostedTo
    }
}
