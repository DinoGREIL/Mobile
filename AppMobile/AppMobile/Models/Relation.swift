//
//  Relation.swift
//  
//
//  Created by etud on 14/03/2023.
//

import Foundation
class RelationModel:ObservableObject{
    var _idbenevole : String
    var _idzone:String
    var _idcreneau:String


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idzone:String,_idcreneau:String,_idbenevole:String){
        self._idzone=_idzone
        self._idcreneau = _idcreneau
        self._idbenevole = _idbenevole
        
        
    }
}
