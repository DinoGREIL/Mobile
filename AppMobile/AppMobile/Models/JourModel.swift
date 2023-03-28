//
//  Jour.swift
//  AppMobile
//
//  Created by etud on 16/03/2023.
//

import Foundation
class JourModel:ObservableObject,Identifiable, Codable{
    var idjour : Int
    var nomjour:String
    var debut:String
    var fin:String
    var festival:Int
    

/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idjour:Int,nomjour:String,debut:String,fin:String,festival:Int){
        self.idjour=_idjour
        self.nomjour=nomjour
        self.debut = debut
        self.fin = fin
        self.festival=festival
        
        
    }
}
