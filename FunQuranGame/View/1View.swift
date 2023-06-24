//
//  1View.swift
//  FunQuranGame
//
//  Created by Muhammad Rezky on 20/06/23.
//

import SwiftUI

struct F_View: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                Spacer()
                Image("mosque")
                VStack(spacing: 0){
                    Spacer().frame(height: 8)
                    Text("Tebak Surah")
                        .font(.custom("Poppins-Bold", size: 24))
                    Spacer().frame(height: 16)
                    Text("Game sambung ayat adalah game dimana kamu akan menebak ayat selanjutnya dari ayat yang ditampilkan. Kamu dapat memilih surahnya atau langsung mengacak surah.")
                        .font(.callout)
                    
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                    Spacer().frame(height: 32)
                    Button{
                    } label: {
                        NavigationLink(destination: F_View()){
                            Text("Mulai Bermain")
                                .font(.custom("Poppins-Bold", size: 14))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .foregroundColor(Color("primary"))
                                .background(Color("secondary"))
                                .cornerRadius(8)
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(8)
                Spacer()
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            .background(Color("primary"))
        }
    }
    
}

struct E_View: View {
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
                            NavigationLink(destination: F_View()){
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
    
}


struct G_View: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                Spacer()
                VStack(spacing: 0){
                    Text("Potongan ayat di atas terletak pada Surah")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.7))
                    
                    Spacer().frame(height: 16)
                    Text("الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer().frame(height: 24)
                    VStack(spacing: 16){
                        ForEach(0..<4){_ in
                            HStack{
                                Rectangle()
                                    .frame(width: 16, height: 16)
                                    .cornerRadius(16)
                                    .foregroundColor(.gray.opacity(0.2))
                                Spacer()
                                Text("Al-Faatiha")
                                
                            }.padding( 16)
                            
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 9)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                        }
                    }
                    
                    
                    Spacer().frame(height: 32)
                    Button{
                    } label: {
                        NavigationLink(destination: F_View()){
                            Text("Soal Selanjutnya")
                                .font(.custom("Poppins-Bold", size: 14))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .foregroundColor(Color.white)
                                .background(Color("primary"))
                                .cornerRadius(8)
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(8)
                Spacer()
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            .background(Color("primary"))
        }
    }
    
}

struct E_View_Previews: PreviewProvider {
    static var previews: some View {
        G_View()
    }
}
