//
//  TimerView.swift
//  SpeedwayGame
//
//  Created by Aleksandra Plichta on 22/10/2025.
//

import SwiftUI
import UIKit

struct TimerView: View {
    @ObservedObject var controller: GameController
    
    var largeTitleSystemFontSize: CGFloat {
        let uiFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        return uiFont.pointSize
    }
    
    var body: some View {
        Text(formattedTime)
            .onAppear {
                controller.startTimer()
            }
            .onDisappear {
                controller.stopTimer()
            }
            .padding(.all, 6)
            .shadow(color: .black, radius: 3)
            .cornerRadius(20)
            .font(.system(size: largeTitleSystemFontSize, weight: .bold, design: .monospaced))
            .foregroundColor(Color.white)
            .bold()
            .padding(.bottom, 40)
    } // end body: some View
    
    var formattedTime: String {
        let minutes = controller.remainingTime/60
        let seconds = controller.remainingTime % 60
        return String(format: "%0d:%02d", minutes, seconds)
    }
    
    
    
    
} // end TimerView


#Preview {
    let controller = GameController()
    TimerView(controller: controller)
}
