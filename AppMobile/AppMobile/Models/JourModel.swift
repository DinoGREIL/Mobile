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
    var debut:TimeInterval
    var fin:TimeInterval
    var festival:FestivalModel
    

/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idjour:String,nomjour:String,debut:TimeInterval,fin:TimeInterval,festival:FestivalModel){
        self._idjour=_idjour
        self.nomjour=nomjour
        self.debut = debut
        self.fin = fin
        self.festival=festival
        
        
    }
}
