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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createMeme(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "createFromCollection", sender: sender)
    }
}
