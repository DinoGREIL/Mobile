//
//  Relation.swift
//  
//
//  Created by etud on 14/03/2023.
//

import Foundation
class TravailModel:ObservableObject{
    var benevole : BenevoleModel
    var zone:ZoneModel
    var creneau:CreneauModel


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(zone:ZoneModel,creneau:CreneauModel,benevole:BenevoleModel){
        self.zone=zone
        self.creneau = creneau
        self.benevole = benevole
        
        
    }
}
