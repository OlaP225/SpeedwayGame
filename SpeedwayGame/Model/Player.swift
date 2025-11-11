//
//  Player.swift
//  SpeedwayGame
//
//  Created by Aleksandra Plichta on 11/11/2025.
//

import Foundation

struct Player: Identifiable, Equatable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var imageName: String
}
