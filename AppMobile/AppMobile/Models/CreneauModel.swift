//
//  Creneau.swift
//  
//
//  Created by etud on 14/03/2023.
//

import Foundation
class CreneauModel:ObservableObject{
    var _idcreneau : String
    var debut:String
    var fin:String
    var jour:JourModel
    

/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idcreneau:String,debut:String,fin:String,jour:JourModel){
        self._idcreneau=_idcreneau
        self.debut = debut
        self.fin = fin
        self.jour=jour
        
        
    }
}
