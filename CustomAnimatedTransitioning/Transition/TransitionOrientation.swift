//
//  TransitionOrientation.swift
//  CustomAnimatedTransitioning
//
//  Created by Sun on 20/05/2022.
//

import UIKit

enum TransitionOrientation {
    case top(height: CGFloat)
    case bottom(height: CGFloat)
    case center(height: CGFloat)
    
    var frame: CGRect {
        let screenWidth = UIScreen.main.bounds.width
        switch self {
        case .top (let height):
            return CGRect(x: 0, y: 0, width: screenWidth, height: height)
        case .bottom (let height):
            let y = UIScreen.main.bounds.height - height
            return CGRect(x: 0, y: y, width: screenWidth, height: height)
        case .center(let height):
            let y = UIScreen.main.bounds.height - height
            return CGRect(x: 0, y: y/2, width: screenWidth, height: height)
        }
    }
}
