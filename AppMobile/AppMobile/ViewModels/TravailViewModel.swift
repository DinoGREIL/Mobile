//
//  TravailViewModel.swift
//  AppMobile
//
//  Created by etud on 21/03/2023.
//

import Foundation
class TravailViewModel:Equatable{
    static func == (lhs: TravailViewModel, rhs: TravailViewModel) -> Bool {
        return (lhs.zone == rhs.zone && lhs.creneaux == rhs.creneaux && lhs.benevole == rhs.benevole)
    }
    
    private(set) var model : TravailModel
    var zone : ZoneModel{
        return model.zone
    }
    var creneau: CreneauModel{
        return model.creneau
    }
    var benevole: BenevoleModel{
        return model.benevole
    }
    
    init(travail: TravailModel){
        self.model = travail
    }
    
}
