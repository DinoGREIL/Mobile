//
//  BenevoleState.swift
//  AppMobile
//
//  Created by etud on 24/03/2023.
//

import Foundation
enum BenevoleState {
    case ready
    case changingName(String)
    case error
    case loadingBenevoles
    case loadedBenevoles([BenevoleModel])
    
}
