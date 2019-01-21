//
//  MemeCollectionViewCell.swift
//  MemeMe2.0
//
//  Created by Sabrina on 1/21/19.
//  Copyright © 2019 Sabrina Svedin. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    // MARK: Cell Customization
    
    func setUpImage() {
        let imageSize = CGRect(x: 0, y: 0, width: 100.0, height: 100.0)
        memeImageView.frame = imageSize
        memeImageView.contentMode = .scaleAspectFill
        memeImageView.clipsToBounds = true
    }
    
}
