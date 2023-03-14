//
//  Zone.swift
//  
//
//  Created by etud on 14/03/2023.
//

import Foundation
class ZoneModel:ObservableObject{
    var _idzone : String
    var nomzone:String


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idzone:String,nomzone:String){
        self._idzone=_idzone
        self.nomzone = nomzone
        
        
    }
}
