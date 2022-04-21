//
//  ViewController.swift
//  DownImage
//
//  Created by Sun on 21/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()    }
    
    func fetchImage() {
        let urlString = "https://freerangestock.com/thumbnail/137610/lonely-man-under-night-sky--starry-sky-over-the-horizon--conte.jpg"
        let url = URL(string: urlString)!
        let data = try? Data(contentsOf: url)
        myImageView.image = UIImage(data: data!)
    }

    @IBAction func savePhoto(_ sender: AnyObject) {
        let imageData = UIImagePNGRepresentation(myImageView.image!)
        let compresedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Saved", message: "Your image has been saved", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
        
    }
}

