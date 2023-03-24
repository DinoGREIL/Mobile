//
//  ZoneState.swift
//  AppMobile
//
//  Created by etud on 24/03/2023.
//

import Foundation
enum ZoneState {
    case ready
    case changingName(String)
    case error
    case loadingZones
    case loadedZones([ZoneModel])
    
}
