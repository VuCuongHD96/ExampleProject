//
//  BaseResult.swift
//  RemoteNotification
//
//  Created by Sun on 11/12/2021.
//

import Foundation

enum BaseResult<T: Codable> {
    case success(T)
    case failure
}
