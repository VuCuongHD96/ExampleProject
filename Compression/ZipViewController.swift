//
//  ZipViewController.swift
//  Compression
//
//  Created by Sun on 16/05/2022.
//

import UIKit
//import Gzip

class ZipViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dict = ["cuong": 123123]
        let data = try? JSONSerialization.data(withJSONObject: dict, options: [])
        print(data)
//        let compressedData = try! data?.gzipped()
//        print(compressedData)

    }
}
