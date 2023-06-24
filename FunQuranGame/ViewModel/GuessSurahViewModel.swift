//
//  GuessSurahViewModel.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

enum ViewState {
    case empty
    case loading
    case loaded
}

enum GameState : String{
    case empty = "empty"
    case win = "win"
    case lose = "lose"
}

class GuessSurahViewModel: ObservableObject {
    @Published var errorMessage: String? = nil
    @Published var viewState = ViewState.empty
    @Published var gameState = GameState.empty
    @Published var listSurah: [SurahModel] = [SurahModel]()
    @Published var gameData: GuessSurahQuestionModel?
    @Published var selectedSurahIndex: Int? = nil
    @Published var selectedAnswerIndex: Int? = nil
    
    let surahService: SurahService
    let numberOfChoices = 4
    let totalSurahs = 114
    
    init(surahService: SurahService = SurahService()) {
        self.surahService = surahService
        loadGameResource()
    }
    
    func nextQuestion() {
        resetState()
        loadGameResource()
    }
    
    func answer(_ index: Int) {
        if(gameState == .empty){
            
            selectedAnswerIndex = index
            gameState = (index == selectedSurahIndex) ? .win : .lose
        }
    }
    
    func loadGameResource() {
        viewState = .loading
        selectedSurahIndex = Int.random(in: 0..<numberOfChoices)
        
        let chosenSurahIds = generateRandomSurahIds()
        fetchSurahs(chosenSurahIds)
    }
    
    private func resetState() {
        selectedSurahIndex = nil
        selectedAnswerIndex = nil
        errorMessage = nil
        viewState = .empty
        gameState = .empty
        DispatchQueue.main.async {
            self.listSurah = [SurahModel]()
        }
    }
    
    private func startGame() {
        gameData = GuessSurahQuestionModel(listSurah: listSurah, selectedSurahIndex: selectedSurahIndex!)
        viewState = .loaded
    }
    
    private func generateRandomSurahIds() -> Set<Int> {
        var chosenSurahIds: Set<Int> = []
        while chosenSurahIds.count < numberOfChoices {
            let randomId = Int.random(in: 1...totalSurahs)
            chosenSurahIds.insert(randomId)
        }
        return chosenSurahIds
    }
    
    private func fetchSurahs(_ ids: Set<Int>) {
        let dispatchGroup = DispatchGroup()
        for id in ids {
            dispatchGroup.enter()
            surahService.fetchSurah(id) { result in
                defer { dispatchGroup.leave() }
                switch result {
                case .success(let apiResponse):
                    DispatchQueue.main.async {
                        self.listSurah.append(apiResponse.data)
                    }
                case .failure(let error):DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    
                }
                }
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.startGame()
        }
    }
}
//
//class GuessSurahViewModel : ObservableObject {
//    @Published var errorMessage: String? = nil
//    @Published var viewState = ViewState.empty
//    @Published var gameState = GameState.empty
//
//    let surahService: SurahService
//    init(surahService: SurahService = SurahService()){
//        self.surahService = surahService
//    }
//
//    @Published var listSurah: [SurahModel] = [SurahModel]()
//    @Published var gameData: GuessSurahQuestionModel?
//    @Published var selectedSurahIndex: Int? = nil // true index
//    @Published var selectedAnswerIndex: Int? = nil
//
//    func nextQuestion(){
//        selectedSurahIndex = nil
//        selectedAnswerIndex = nil
//        errorMessage = nil
//        viewState = .empty
//        gameState = .empty
//        DispatchQueue.main.async {
//            self.listSurah = [SurahModel]()
//        }
//        loadGameResource()
//
//    }
//
//    func answer(_ index: Int){
//        DispatchQueue.main.async {
//            self.selectedAnswerIndex = index
//            if (index == self.selectedSurahIndex){                self.gameState = .win
//            } else {
//                self.gameState = .lose
//            }
//        }
//
//    }
//
//    private func startGame() {
//        gameData =   GuessSurahQuestionModel(listSurah: listSurah, selectedSurahIndex: selectedSurahIndex!)
//    }
//
//
//    func loadGameResource() {
//        viewState = .loading
//        errorMessage = nil
//        DispatchQueue.main.async {
//
//            self.selectedSurahIndex = Int.random(in: 0...3)
//        }
//
//        let numberOfChoices = 4
//        var chosenSurahIds: Set<Int> = []
//
//        while chosenSurahIds.count < numberOfChoices {
//            let randomId = Int.random(in: 1...114)
//            chosenSurahIds.insert(randomId)
//        }
//        print(chosenSurahIds)
//
//        let dispatchGroup = DispatchGroup()
//
//        chosenSurahIds.forEach { id in
//            dispatchGroup.enter()
//            surahService.fetchSurah(id) { result in
//
//                defer { dispatchGroup.leave() }
//                switch result {
//                case .success(let apiResponse):
//                    DispatchQueue.main.async {
//                        self.listSurah.append(apiResponse.data)
//                    }
//                case .failure(let error):
//                    DispatchQueue.main.async {
//                        self.errorMessage = error.localizedDescription
//                    }
//                }
//            }
//        }
//
//        dispatchGroup.notify(queue: .main) {
//            self.startGame()
//            self.viewState = .loaded
////            self.isLoading = false
//        }
//    }
//
//
//
//}
