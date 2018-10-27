//
//  SnapsViewController.swift
//  Snapchat Clone
//
//  Created by Christine Luo on 10/21/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var selectedSnap: Snap!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads[threadNames[section]]!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SnapsTableViewCell") as! SnapsTableViewCell
        let snap = threads[threadNames[indexPath.section]]![indexPath.row]

        cell.IconImageView.image = snap.readOrUnread
        cell.SnapUserLabel.text = snap.name
        
        let date2 = Date()
        let minutesAgo = Calendar.current.dateComponents([.minute], from: snap.date, to: date2).minute ?? 0
        cell.MinutesAgo.text = String(minutesAgo) + " minutes ago"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threads.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSnap = threads[threadNames[indexPath.section]]![indexPath.row]
        performSegue(withIdentifier: "goToImagePreview", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerToSendSnapTo = segue.destination as? ImagePreviewViewController {
            viewControllerToSendSnapTo.selectedSnap = self.selectedSnap!
        }
    }
    
}
