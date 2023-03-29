//
//  TravailState.swift
//  AppMobile
//
//  Created by etud on 29/03/2023.
//

import Foundation

enum TravailState {
    case ready
    case changingName(String)
    case error
    case loadingTravails
    case loadedTravails([TravailModel])
    
}
