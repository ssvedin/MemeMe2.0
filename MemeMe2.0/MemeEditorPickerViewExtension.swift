//
//  MemeEditorPickerViewExtension.swift
//  MemeMe2.0
//
//  Created by Sabrina on 1/23/19.
//  Copyright © 2019 Sabrina Svedin. All rights reserved.
//

import UIKit

extension MemeEditorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Picker View to change fonts
    
    func setUpFontPickerView() {
        fontPickerView.delegate = self
        fontPickerView.dataSource = self
        fontPickerData = ["Impact", "Copperplate", "Noteworthy-Bold", "Chalkduster", "HoeflerText-BlackItalic"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelection = fontPickerData[row]
        changeFont(selectedFont)
        fontPickerView.isHidden = true
    }
    
 
    

 


}
