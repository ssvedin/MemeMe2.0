//
//  MemeDetailViewController.swift
//  MemeMe2.0
//
//  Created by Sabrina on 1/21/19.
//  Copyright © 2019 Sabrina Svedin. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var meme: Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView!.image = meme.memedImage
    }
}
