//
//  MemeCollectionViewController.swift
//  MemeMe2.0
//
//  Created by Sabrina on 1/19/19.
//  Copyright © 2019 Sabrina Svedin. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {

    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
            let meme = self.memes[(indexPath as NSIndexPath).row]
            
            cell.memeImageView?.image = meme.memedImage
            
            return cell
    }

    @IBAction func createMeme(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "createFromCollection", sender: sender)
    }
}
