//
//  SurahModel.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

struct SurahModel: Codable{
    let number: Int
    let name: String
    let englishName: String
    let englishNameTranslation: String
    let numberOfAyahs: Int
    let revelationType: String
    let ayahs: [AyahModel]?
    
    
    
    static func getAllSurah() -> [SurahModel] {
           if let fileURL = Bundle.main.url(forResource: "surahs", withExtension: "json") {
               do {
                   let data = try Data(contentsOf: fileURL)
                   let decoder = JSONDecoder()
                   return try decoder.decode([SurahModel].self, from: data)
               } catch {
                   print("Error loading surah data: \(error)")
               }
           } else {
               print("surah.json file not found.")
           }
           
           return []
       }
}
