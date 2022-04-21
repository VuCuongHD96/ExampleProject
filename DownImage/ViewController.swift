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
        
        ImageManager.savePhoto( urlString: urlString)
    }

    @IBAction func savePhoto(_ sender: AnyObject) {
        ImageManager.savePhoto(image: myImageView.image!)
    }
}
