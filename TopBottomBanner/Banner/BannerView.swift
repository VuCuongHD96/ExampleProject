//
//  BannerView.swift
//  TopBottomBanner
//
//  Created by Sun on 13/05/2022.
//

import UIKit
import WebKit

class BannerView: WKWebView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        load()
        setupView()
    }

    func setupView() {
        backgroundColor = .green
        scrollView.bounces = false
        scrollView.isScrollEnabled = false
    }
    
    func load() {
        let urlString = "https://intphcm.com/data/upload/banner-quang-cao.jpg"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        load(urlRequest)
    }
    
    func setupFrame() { 
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        frame = rect
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print("-------- debug --------- change Orentaion")
        setupFrame()
    }
}
