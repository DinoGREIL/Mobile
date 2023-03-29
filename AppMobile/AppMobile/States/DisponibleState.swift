//
//  DisponibleState.swift
//  AppMobile
//
//  Created by etud on 29/03/2023.
//

import Foundation
enum DisponibleState {
    case ready
    case changingName(String)
    case error
    case loadingDisponibles
    case loadedDisponibles([DisponibleModel])
    
}
