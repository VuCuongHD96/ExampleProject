//
//  Parser.swift
//  RemoteNotification
//
//  Created by Sun on 11/12/2021.
//

import Foundation

protocol ParserType {
    static func decodable<T: Codable>(json: [String : Any], result: T.Type) -> BaseResult<T> 
}

final class Parser {
    
    // MARK: - Property
    static private let decoder = JSONDecoder()
}

extension Parser: ParserType {
    
    // MARK: - Transform
    static func decodable<T: Codable>(json: [String : Any], result: T.Type) -> BaseResult<T> {
        if let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
           let result = try? decoder.decode(T.self, from: data) {
            return BaseResult.success(result)
        } else {
            return BaseResult.failure
        }
    }
}
