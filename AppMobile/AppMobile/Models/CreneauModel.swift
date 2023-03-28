//
//  Creneau.swift
//  
//
//  Created by etud on 14/03/2023.
//

import Foundation
class CreneauModel:ObservableObject,Identifiable, Codable{
    var idcreneau : Int
    var debut:String
    var fin:String
    var jour:Int
    

/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idcreneau:Int,debut:String,fin:String,jour:Int){
        self.idcreneau=_idcreneau
        self.debut = debut
        self.fin = fin
        self.jour=jour
        
        
    }
}
