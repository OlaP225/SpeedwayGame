//
//  ContentView.swift
//  SpeedwayGame
//
//  Created by Aleksandra Plichta on 21/10/2025.
//

import SwiftUI

struct Player: Identifiable, Equatable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var imageName: String
}

struct ContentView: View {
    @State private var remainingTime: Int = 240
    @State private var timer: Timer? = nil
    
    @State private var players = [
        Player(firstName: "Maciej", lastName: "J", imageName: "player1"),
        Player(firstName: "Bart", lastName: "K", imageName: "player2"),
        Player(firstName: "Daniel", lastName: "B", imageName: "player3"),
        Player(firstName: "Tai", lastName: "W", imageName: "player1")
    ]
    @State private var editMode: EditMode = .active
    
    private var timeToStart = Date.now
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Bieg 1")
                        .padding(.all, 6)
                        .shadow(color: .black, radius: 3)
                        .cornerRadius(20)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.bottom, 40)
                    
                    Spacer()
                    
                    TimerView(remainingTime: $remainingTime, timer: $timer)
                    
                    Spacer()
                }
                
                
                Text("Ustaw zawodników według ilości punktów, które według Ciebie zdobędą i zagłosuj!")
                    .padding(.horizontal, 20)
                    .shadow(color: .black, radius: 3)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                VStack{
                    List {
                        ForEach(Array(players.enumerated()), id: \.element.id) { index, player in
                            
                            HStack{
                                
                                Text("\(3-index)")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(width: 20)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 20)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                                Spacer()
                                
                                
                                Image(player.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                    .shadow(radius: 5)
                                
                                Text(player.firstName)
                                    .font(.title2)
                                    .foregroundColor(.black)
                                Text(player.lastName)
                                    .font(.title2)
                                    .foregroundColor(.black)
                            
                                
                                Spacer()
                                Spacer()
                            }
                            .listRowBackground(Color.white.opacity(0.8))
                        
                            
                        }
                        .onMove(perform: onMove)
                    }
                    .environment(\.editMode, $editMode)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .frame(width: 400, height: 500)
                    
                }
                
            

                Spacer()
                
            }
            

        }
        
        
    }
    func onMove( from source: IndexSet, to destination: Int){
        players.move(fromOffsets: source, toOffset: destination)
    }
    
}

#Preview {
    ContentView()
}
