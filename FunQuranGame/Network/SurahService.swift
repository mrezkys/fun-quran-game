//
//  SurahService.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

class SurahService : ObservableObject{
    let service: APIServiceProtocol
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    func fetchSurah(_ id: Int, completion: @escaping (Result<APIResponse<SurahModel>, APIError>) -> Void) {
        let url = URL(string: "http://api.alquran.cloud/v1/surah/\(id)")
        service.fetch(APIResponse<SurahModel>.self, url: url, completion: completion)
    }
}
