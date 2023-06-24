//
//  ContentView.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("logo")
                    Text("Islamic Game")
                        .font(.custom("Poppins-Bold", size: 14))
                        .foregroundColor(.white)
                    Spacer()
                    VStack(spacing: 0){
                        Text("Select Game")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(.white)
                        Spacer().frame(height: 24)
                        
                        Button{
                        } label: {
                            NavigationLink(destination: GuessSurahView()){
                                Text("Guess Surah Game")
                                    .font(.custom("Poppins-Bold", size: 18))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 24)
                                    .foregroundColor(Color("primary"))
                                    .background(Color("secondary"))
                                    .cornerRadius(8)
                                    .padding(.horizontal, 24)
                            }
                        }
                        Spacer().frame(height: 24)
                        Button{
                        } label: {
                            NavigationLink(destination: ConnectAyahView()){
                                Text("Connect Ayah Game")
                                    .font(.custom("Poppins-Bold", size: 18))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 24)
                                    .foregroundColor(Color("primary"))
                                    .background(.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal, 24)
                            }
                        }
                    }
                    Spacer()
                    Spacer()
                }
                Image("quran")
                    .offset(CGSize(width: 20, height: UIScreen.main.bounds.height - 500))
            }
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            .background(Color("primary"))
        }
    }
//    var body: some View {
//        VStack {
//            if(vm.viewState == .loading){
//                ProgressView()
//            } else if (vm.viewState == .loaded){
//                Text("Sambungan dari ayat ini adalah")
//                Text("\(vm.gameData!.question)")
//
//                List {
//                    ForEach(vm.gameData!.options, id: \.self){ op in
//                        let index = vm.gameData!.options.firstIndex(of: op)
//                        Text(op)
//                    }
//                }
//            }else {
//                Text("Hello")
//            }
//        }
//
//
//    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
