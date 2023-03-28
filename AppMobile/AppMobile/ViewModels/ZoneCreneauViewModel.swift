
//
//  TravailViewModel.swift
//  AppMobile
//
//  Created by etud on 21/03/2023.
//

import Foundation
class ZoneCreneauViewModel:Identifiable, Equatable{
    static func == (lhs: ZoneCreneauViewModel, rhs: ZoneCreneauViewModel) -> Bool {
        return (lhs.zone.idzone == rhs.zone.idzone && lhs.creneau.idcreneau == rhs.creneau.idcreneau)
    }
    
    private(set) var model : ZoneCreneauModel
    var zone : ZoneModel{
        return model.zone
    }
    var creneau: CreneauModel{
        return model.creneau
    }
    
    
    init(zonecreneau: ZoneCreneauModel){
        self.model = zonecreneau
    }
    
}
