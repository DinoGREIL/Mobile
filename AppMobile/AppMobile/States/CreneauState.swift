//
//  CreneauState.swift
//  AppMobile
//
//  Created by etud on 24/03/2023.
//

import Foundation
enum CreneauState {
    case ready
    case changingName(String)
    case error
    case loadingCreneaux
    case loadedCreneaux([CreneauModel])
    
}
