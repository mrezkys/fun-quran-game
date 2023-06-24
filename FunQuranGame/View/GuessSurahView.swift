//
//  GuessSurahView.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import SwiftUI

struct GuessSurahView: View {
    @StateObject var vm = GuessSurahViewModel()
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
           navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
           navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

    }
    
    var body: some View {
        NavigationView{
            VStack {
                if(vm.viewState == .loading){
                    ProgressView()
                } else if (vm.viewState == .loaded){
                    Spacer().frame(height: 32)
                    VStack(spacing: 0){
                        Text("The ayah below is located in the Surah?")
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.7))
                        
                        Spacer().frame(height: 16)
                        Text("\(vm.gameData!.question)")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer().frame(height: 24)
                        VStack(spacing: 16){
                            ForEach(vm.gameData!.options, id: \.self){ op in
                                let index = vm.gameData!.options.firstIndex(of: op)
                                
                                var _ = print(vm.selectedSurahIndex! == index)
                                var buttonColor: Color{
                                    if(vm.gameState == .empty){
                                        return Color.white
                                    } else {
                                        if(vm.selectedSurahIndex == index){
                                            return Color("secondary")
                                        } else {
                                            return Color.white
                                        }
                                    }
                                }
                                HStack{
                                    Rectangle()
                                        .frame(width: 16, height: 16)
                                        .cornerRadius(16)
                                        .foregroundColor(vm.selectedAnswerIndex == index ? Color("primary") : .gray.opacity(0.2))
                                    Spacer()
                                    Text("\(op)")
                                        .foregroundColor(Color.black)
                                    
                                }
                                .padding( 16)
                                .background(buttonColor)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                                .onTapGesture {
                                    vm.answer(index!)
                                    print(vm.selectedAnswerIndex == index)
                                }
                                
                            }
                        }
                        
                        
                        Spacer().frame(height: 32)
                        Button{
                            vm.nextQuestion()
                        } label: {
                            Text("Next Question")
                                .font(.custom("Poppins-Bold", size: 14))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .foregroundColor(Color.white)
                                .background(Color("primary"))
                                .cornerRadius(8)
                            
                        }
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 24)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(8)
                    Spacer()
                } else {
                    EmptyView()
                }
                
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            .background(Color("primary"))
            
        }
        .navigationBarTitle("Guess Surah")
    }
    
}
