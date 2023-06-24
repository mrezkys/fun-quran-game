//
//  ConnectAyahViewModel.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import Foundation

class ConnectAyahViewModel: ObservableObject {
    @Published var errorMessage: String? = nil
    @Published var viewState = ViewState.empty
    @Published var gameState = GameState.empty
    @Published var selectedSurah: SurahModel?  = nil
    @Published var gameData: ConnectAyahQuestionModel? = nil
    @Published var selectedAnswerIndex: Int? = nil

    
    let surahService: SurahService
    
    init(surahService: SurahService = SurahService()) {
        self.surahService = surahService
        loadGameResource()
    }
    
    func loadGameResource(){
        viewState = .loading
        fetchSurah()
    }
    
    func answer(_ index: Int) {
        if(gameState == .empty){
            
                selectedAnswerIndex = index
                gameState = (index == gameData?.correctOptionsIndex) ? .win : .lose
        }
    }
    
    func nextQuestion() {
        resetState()
        loadGameResource()
    }
    
    private func resetState() {
        selectedAnswerIndex = nil
        errorMessage = nil
        viewState = .empty
        gameState = .empty
        DispatchQueue.main.async {
            self.selectedSurah = nil
            self.gameData = nil
        }
    }
    
    
    private func fetchSurah(){
        let selectedSurahIndex  = Int.random(in: 78..<114)
        surahService.fetchSurah(selectedSurahIndex){result in
            switch result{
            case .success(let apiResponse):
                print("success")
                if(apiResponse.data.numberOfAyahs < 6){
                    // re fetch another id
                    self.fetchSurah()
                    return
                }
                DispatchQueue.main.async {
                    self.selectedSurah = apiResponse.data
                    self.startGame()
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func startGame(){
        self.gameData = ConnectAyahQuestionModel(surah: selectedSurah!)
        viewState = .loaded
    }
    
    
    
}
