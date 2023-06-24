//
//  SurahService.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

class APIService : APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void){
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ (data,response, error) in
            if let error = error as? URLError {
                completion(Result.failure(.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(.parsing(error as? DecodingError)))
                }
            } else {
                completion(Result.failure(.unknown))
            }
            
        }
        
        task.resume()
    }
}
