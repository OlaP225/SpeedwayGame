//
//  TimerView.swift
//  SpeedwayGame
//
//  Created by Aleksandra Plichta on 22/10/2025.
//

import SwiftUI
import UIKit

struct TimerView: View {
    @Binding var remainingTime: Int
    @Binding var timer: Timer?
    
    var largeTitleSystemFontSize: CGFloat {
        let uiFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        return uiFont.pointSize
    }
    
    var body: some View {
        Text(formattedTime)
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
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
        let minutes = remainingTime/60
        let seconds = remainingTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    
    private func startTimer() {
        stopTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            if (remainingTime > 0) {
                remainingTime -= 1
            } else if (remainingTime == 0) {
                stopTimer()
            }
            
        }
    } // end startTimer()
    
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    
} // end TimerView


#Preview {
    TimerView(remainingTime: Binding.constant(120), timer: Binding.constant(nil))
}
