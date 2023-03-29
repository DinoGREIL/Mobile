//
//  TravailViewModel.swift
//  AppMobile
//
//  Created by etud on 21/03/2023.
//

import Foundation
class TravailViewModel:Identifiable, Equatable{
    static func == (lhs: TravailViewModel, rhs: TravailViewModel) -> Bool {
        return (lhs.zone == rhs.zone && lhs.creneau == rhs.creneau && lhs.benevole == rhs.benevole)
    }
    
    private(set) var model : TravailModel
    var zone : Int
    var creneau: Int
    var benevole: Int
    
    init(travail: TravailModel){
        self.model = travail
        self.zone=travail.idzone
        self.creneau=travail.idcreneau
        self.benevole=travail.idbenevole
    }
    
}
