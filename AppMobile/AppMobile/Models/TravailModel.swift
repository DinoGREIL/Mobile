//
//  Relation.swift
//  
//
//  Created by etud on 14/03/2023.
//

import Foundation
class TravailModel:ObservableObject,Identifiable, Codable{
    var idbenevole : Int
    var idzone:Int
    var idcreneau:Int


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(zone:Int,creneau:Int,benevole:Int){
        self.idzone=zone
        self.idcreneau = creneau
        self.idbenevole = benevole
        
        
    }
}
