//
//  ContentView.swift
//  SpeedwayGame
//
//  Created by Aleksandra Plichta on 21/10/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var players = [" Maciej Janowski", "Bartłomiej Kowalski", "Daniel Bewley"]
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Image("player1").clipShape(.circle)
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
                    ForEach(players, id: \.self) { player in
                        Text(player)
                        
                    }
                }
                .environment(\.editMode, $editMode)
                .scrollContentBackground(.hidden)
                
                
                
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
