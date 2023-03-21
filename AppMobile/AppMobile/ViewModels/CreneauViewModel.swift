//
//  CreneauViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class CreneauViewModel:Identifiable, Equatable{
    static func == (lhs: CreneauViewModel, rhs: CreneauViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : CreneauModel
    var _id : String{
        return model._idcreneau
    }
    var debut: String{
        return model.nomfestival
    }
    var fin: String{
        return model.nbjours
    }
    var jour:JourModel{
        return model.jour
    }
    
    init(creneau: CreneauModel){
        self.model = festival
    }
    
}
