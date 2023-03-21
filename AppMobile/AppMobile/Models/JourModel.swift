//
//  Jour.swift
//  AppMobile
//
//  Created by etud on 16/03/2023.
//

import Foundation
class JourModel:ObservableObject,Identifiable, Codable{
    var _idjour : String
    var nomjour:String
    var debut:NSTimeInterval
    var fin:NSTimeInterval
    var festival:FestivalModel
    

/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idjour:String,nomjour:String,debut:NSTimeInterval,fin:NSTimeInterval,festival:FestivalModel){
        self._idcreneau=_idcreneau
        self.nomjour=nomjour
        self.debut = debut
        self.fin = fin
        self.festival=festival
        
        
    }
}
