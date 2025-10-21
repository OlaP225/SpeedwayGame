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
    
    @State private var players = [
        Player(firstName: "Maciej", lastName: "Janowski", imageName: "player1"),
        Player(firstName: "Bartłomiej", lastName: "Kowalski", imageName: "player2"),
        Player(firstName: "Daniel", lastName: "Bewley", imageName: "player3"),
        Player(firstName: "Tai", lastName: "Wofinden", imageName: "player1")
    ]
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Image("dashund2").clipShape(.circle)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(color: Color.white, radius: 3)
            Text("Bieg 1")
                .padding(.all, 6)
                .shadow(color: .white, radius: 20)
                .cornerRadius(20)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .bold()
                .padding(.bottom, 650)
                .padding(.trailing, 210)
            VStack{
                List {
                    ForEach(players, id: \.id) { player in
                        
                        HStack{
                            
                            Image(player.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                .shadow(radius: 5)
                            Spacer()
                            
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
                }
                .environment(\.editMode, $editMode)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .frame(width: 400, height: 500)
                .cornerRadius(20)
                
                
                
                Button(action: { withAnimation {
                    editMode = (editMode == .inactive) ? .active : .inactive
                }
                }) {
                    Text(editMode == .inactive ? "Edytuj" : "Gotowe")
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .bold()
                }
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
