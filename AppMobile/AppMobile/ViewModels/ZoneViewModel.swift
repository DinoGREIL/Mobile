//
//  ZoneViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class ZoneViewModel:Equatable{
    static func == (lhs: ZoneViewModel, rhs: ZoneViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : ZoneModel
    var _id : String{
        return model._idzone
    }
    var nomzone: String{
        return model.nomzone
    }
    var nbbenevole: Int{
        return model.nbbenevole
    }
    var creneaux:[CreneauModel]{
        return model.creneaux
    }
    
    init(zone: ZoneModel){
        self.model = jour
    }
    
}
