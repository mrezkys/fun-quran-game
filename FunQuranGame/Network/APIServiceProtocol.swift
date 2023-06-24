//
//  APIServiceProtocol.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void)
}

