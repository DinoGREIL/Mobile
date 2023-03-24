//
//  FestivalState.swift
//  AppMobile
//
//  Created by etud on 24/03/2023.
//

import Foundation
enum FestivalState {
    case ready
    case changingName(String)
    case error
    case loadingFestivals
    case loadedFestivals([FestivalModel])
    
}
