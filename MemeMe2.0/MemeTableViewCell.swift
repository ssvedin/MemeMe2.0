//
//  MemeTableViewCell.swift
//  MemeMe2.0
//
//  Created by Sabrina on 1/21/19.
//  Copyright © 2019 Sabrina Svedin. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    // MARK: Outlets

    @IBOutlet weak var tableImageView: UIImageView!
    
    // MARK: Cell Customization
    
    func setUpImage() {
        let imageSize = CGRect(x: 0, y: 0, width: 100.0, height: 100.0)
        tableImageView.frame = imageSize
        tableImageView.contentMode = .scaleToFill
        tableImageView.clipsToBounds = true
    }
 


}
