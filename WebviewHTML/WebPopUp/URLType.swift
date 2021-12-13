//
//  URLType.swift
//  WebviewHTML
//
//  Created by Sun on 23/11/2021.
//

import Foundation

enum URLType {
    case template5
    case feedback
    case spin
    case slider
    case mailing
    case limitedTime
    
    var url: String {
        switch self {
        case .template5: return "https://test38.mobio.vn/template5.html"
        case .feedback: return "https://test38.mobio.vn/template/Feedback.html"
        case .spin: return "https://test38.mobio.vn/template/spin.html"
        case .slider: return "https://test38.mobio.vn/template/slider.html"
        case .mailing: return "https://test38.mobio.vn/template/Mailing.html"
        case .limitedTime: return "https://test38.mobio.vn/template/LimitedTime.html"
        }
    }
}
