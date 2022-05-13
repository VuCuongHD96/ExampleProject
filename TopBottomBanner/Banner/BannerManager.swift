//
//  BannerManager.swift
//  TopBottomBanner
//
//  Created by Sun on 13/05/2022.
//

import UIKit

struct BannerManager {
    
    func showBanner(viewController: UIViewController) {
        let bannerView = createBannerView()
        viewController.view.addSubview(bannerView)
    }
    
    func createBannerView() -> BannerView {
        let bannerView = BannerView()
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        bannerView.frame = rect
        return bannerView
    }
}
