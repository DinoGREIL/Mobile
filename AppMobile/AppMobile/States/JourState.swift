//
//  JourState.swift
//  AppMobile
//
//  Created by etud on 24/03/2023.
//

import Foundation

enum JourState {
    case ready
    case changingName(String)
    case error
    case loadingJours
    case loadedJours([JourModel])
    
}
