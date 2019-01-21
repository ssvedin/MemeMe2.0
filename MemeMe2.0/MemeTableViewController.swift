//
//  MemeTableViewController.swift
//  MemeMe2.0
//
//  Created by Sabrina on 1/19/19.
//  Copyright © 2019 Sabrina Svedin. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {

    @IBOutlet var memeTableView: UITableView!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeTableView.rowHeight = CGFloat(100.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath) as! MemeTableViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]

        cell.textLabel?.text = "\(meme.topText)" + " " + "\(meme.bottomText)"
        cell.setUpImage()
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    @IBAction func createMeme(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "createFromTable", sender: sender)
    }
    
    
}
