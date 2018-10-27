//
//  imagePickerController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var imageCollectionView: UICollectionView!
    @IBAction func unwindToImagePickerController(segue:UIStoryboardSegue) { }
    
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.collectionViewLayout = ImageFlowLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func selectImage(_ image: UIImage) {
        selectedImage = image
        performSegue(withIdentifier: "goToFeeds", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerToSendImageTo = segue.destination as? FeedViewController {
            viewControllerToSendImageTo.imageFromImagePickerController = selectedImage!
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as? ImageCollectionViewCell else {
            print("error dequeuing cell at index path \(indexPath)")
            return UICollectionViewCell()
        }
        cell.image.image = allImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell {
            selectImage(selectedCell.image.image!)
        }
        
    }
    
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindtoImagePick", sender: self)
    }
}
