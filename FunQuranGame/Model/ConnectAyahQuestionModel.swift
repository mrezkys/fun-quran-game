//
//  ConnectAyahQuestionModel.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

struct ConnectAyahQuestionModel{
    let question: String
    let options: [String]
    let correctOptionsIndex: Int
    
    init(surah: SurahModel) {
         self.question = surah.ayahs![0].text
         
         var optionStrings = [String]()
        let correctIndex = Int(arc4random_uniform(4)) // Generate random index between 0 and 3
         
         for index in 0...3 {
             if index == correctIndex {
                 optionStrings.append(surah.ayahs![1].text) // Use surah.ayahs![1] as the correct option
             } else {
                 optionStrings.append(surah.ayahs![index + 2].text) // Use surah.ayahs![index + 2] for other options
             }
         }
         
         self.options = optionStrings
         self.correctOptionsIndex = correctIndex
        print(surah.englishName)
        print(surah.ayahs)
        print(self)
     }
    
//    init(surah: SurahModel) {
//        self.question = surah.ayahs![0].text
//        var optionStrings = [String]()
//        for index in (0...4){
//            optionStrings.append(surah.ayahs![index].text)
//        }
//        self.options = optionStrings
//        self.correctOptionsIndex = 1 // after 0
//    }
}
