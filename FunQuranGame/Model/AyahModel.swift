//
//  AyahModel.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

struct AyahModel: Codable {
    let number: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case number = "numberInSurah"
        case text
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        self.text = try container.decode(String.self, forKey: .text)
    }
    
}
