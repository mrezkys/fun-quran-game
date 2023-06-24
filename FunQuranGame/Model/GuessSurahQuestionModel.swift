//
//  GuessSurahQuestionModel.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

struct GuessSurahQuestionModel {
    let question: String
    let options: [String]
    let correctOptionsIndex: Int
    
    init(listSurah: [SurahModel], selectedSurahIndex: Int) {
        self.question = listSurah[selectedSurahIndex].ayahs![1].text
        var optionStrings = [String]()
        for surah in listSurah {
            optionStrings.append(surah.englishName)
        }
        self.options = optionStrings
        self.correctOptionsIndex = selectedSurahIndex
        
        
        
        print(selectedSurahIndex)
    }
}
