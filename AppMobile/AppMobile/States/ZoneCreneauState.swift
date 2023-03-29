//
//  ZoneCreneauState.swift
//  AppMobile
//
//  Created by etud on 29/03/2023.
//

import Foundation

enum ZoneCreneauState {
    case ready
    case changingName(String)
    case error
    case loadingZoneCreneau
    case loadedZoneCreneau([ZoneCreneauModel])
    
}
