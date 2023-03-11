//
//  ContentView.swift
//  Card game
//
//  Created by Bruno on 10.03.2023..
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var playerCARD = "back"
    @State var aiCARD = "back"
    @State var playerScore = 0
    @State var aiScore = 0
    @State var playercardnum = 0
    @State var aicardnum = 0
    @State private var showText = false
    @State private var showDeal = true
    
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            Spacer()
            VStack {
                Spacer()
                Image("card logo")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .imageScale(.small)
                    .padding(.leading, 25)
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCARD)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(aiCARD)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
                Spacer()
                if showDeal {
                    Button {
                        Deal()
                        AudioServicesPlaySystemSound(1104)
                        AudioServicesPlaySystemSound(4095)
                    } label: {
                        Image("button")
                    }
                }
                Spacer()
                if showText {
                        Button {
                            restart()
                            showText = false
                        } label: {
                            ZStack {
                                Color.white
                                    .cornerRadius(30)
                                    .frame(width: 200, height: 40)
                                    .shadow(color: .white, radius: 15)
                                Text("GAME OVER")
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                                    .font(.title)
                            }
                        }
                        .padding(.bottom, 12.0)
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack{
                        Text("Player")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        
                        Text(String(playerScore))
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                    }
                    Spacer()
                    VStack{
                        Text("AI")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        
                        Text(String(aiScore))
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                    }
                    Spacer()
                }
                //Spacer()
            }
        }
    }
    func Deal(){
        playercardnum = Int.random(in: 2...14)
        playerCARD = "card" + String(playercardnum)
        
        aicardnum = Int.random(in: 2...14)
        aiCARD = "card" + String(aicardnum)
        
        if playercardnum > aicardnum {
            playerScore += 1
        }
        else if aicardnum > playercardnum {
            aiScore += 1
        }
        if playerScore == 10 {
            showText = true
            showDeal = false
        }
        if aiScore == 10 {
            showText = true
            showDeal = false
        }
    }
        
        func restart(){
            playerScore = 0
            aiScore = 0
            playerCARD = "back"
            aiCARD = "back"
            showDeal = true
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
