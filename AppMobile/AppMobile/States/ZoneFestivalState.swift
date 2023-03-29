//
//  ZoneFestivalState.swift
//  AppMobile
//
//  Created by etud on 29/03/2023.
//

import Foundation
enum ZoneFestivalState {
    case ready
    case changingName(String)
    case error
    case loadingZoneFestival
    case loadedZoneFestival([ZoneFestivalModel])
    
}
