//
//  feedViewController.swift
//  Snapchat Clone
//
//  Created by Christine Luo on 10/22/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var botLabel: UILabel!
    @IBAction func sendButton(_ sender: Any) {
        let newSnap = Snap(readOrUnread: UIImage(named: "unread")!, image: imageFromImagePickerController, name: "Christine", date: Date(), feedPostedTo: feed)
        threads[feed]!.append(newSnap)
        let alert = UIAlertController(title: "Success!", message: "Your snap has been posted!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay!", style: .default) {(action) in self.performSegue(withIdentifier: "unwindToImagePick", sender: action)}
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    var feedNames: [String] = ["Memes", "Dog Spots", "Random"]
    var imageFromImagePickerController: UIImage!
    var feed: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedTableViewCell
        let feed = feedNames[indexPath.row]
        
        cell.setFeed(feed: feed)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! FeedTableViewCell
        let string = selectedCell.feed.text
        feed = string
        botLabel.text = "Post to: " + string!
    }
}
