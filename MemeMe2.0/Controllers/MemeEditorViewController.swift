//
//  MemeEditorViewController.swift
//  Image Picker Experiment
//
//  Created by Sabrina on 12/29/18.
//  Copyright © 2018 Sabrina Svedin. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    // MARK: Outlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    // Outlet and properties for Font Picker View
   @IBOutlet weak var fontPickerView: UIPickerView!
    var fontPickerData: [String] = [String]()
    var selectedFont: String = "Impact"
    var pickerSelection = ""
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField(textField: textField1, text: "TOP")
        setUpTextField(textField: textField2, text: "BOTTOM")
        setUpFontPickerView()
        shareButton.isEnabled = false
        fontPickerView.isHidden = true
        pickerSelection = fontPickerData[0]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: Picking an image
    
    @IBAction func pickAnImageFromAlbum (_ sender: Any) {
        pickAnImage(sender)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        pickAnImage(sender)
    }
    
    func pickAnImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        if  (sender as AnyObject).tag == 1 {
            pickerController.sourceType = .camera
        } else {
            pickerController.sourceType = .photoLibrary
        }
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            shareButton.isEnabled = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Generating Meme
    
    func save() {
        // Create the meme
        let memedImage = generateMemedImage()
        let meme = Meme(topText: textField1.text!, bottomText: textField2.text!, originalImage: imageView.image!, memedImage: memedImage)
        
        // Add it to the memes array in the Application Delegate
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
    
    func generateMemedImage() -> UIImage {
        configureBars(true)
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        configureBars(false)
        
        return memedImage
    }
    
    func configureBars(_ isHidden: Bool) {
        toolBar.isHidden = isHidden
        navBar.isHidden = isHidden
    }
    
    // MARK: Sharing Meme
    
    @IBAction func shareMeme(_ sender: UIBarButtonItem) {
        let memedImage = generateMemedImage()
        let activityVC = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        
        activityVC.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool?, returnedItems: [Any]?, error: Error?) in
            if completed! {
                self.save()
                // Dismiss the Editor after sharing
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    // MARK: Resetting the Meme Editor
    
    @IBAction func resetButton(_ sender: UIBarButtonItem) {
         textField1.text = "TOP"
         textField2.text = "BOTTOM"
         self.imageView.image = nil
         shareButton.isEnabled = false
    }
    
    // MARK: Change Font
    
    func selectFont(fontName: String) {
        textField1.font = UIFont(name: fontName, size: 40)!
        textField2.font = UIFont(name: fontName, size: 40)!
        selectedFont = fontName
    }
    
    @IBAction func changeFont(_ sender: Any) {
        fontPickerView.isHidden = false
        selectFont(fontName: pickerSelection)
    }
    
    // MARK: Canceling the Editor and going back to Sent Memes
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}



