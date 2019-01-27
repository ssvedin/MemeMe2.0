//
//  MemeEditorTextFieldExtension.swift
//  MemeMe2.0
//
//  Created by Sabrina on 1/27/19.
//  Copyright © 2019 Sabrina Svedin. All rights reserved.
//

import Foundation
import UIKit

// MARK: TextFields

extension MemeEditorViewController {
    
    func setUpTextField(textField: UITextField, text: String) {
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: selectedFont, size: 40)!,
            NSAttributedString.Key.strokeWidth: -4.0
        ]
        
        textField.delegate = self
        textField.text = text
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .center
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

