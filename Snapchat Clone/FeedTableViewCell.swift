//
//  feedTableViewCell.swift
//  Snapchat Clone
//
//  Created by Christine Luo on 10/22/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var feed: UILabel!
    
    func setFeed(feed: String) {
        self.feed.text = feed
    }
}
