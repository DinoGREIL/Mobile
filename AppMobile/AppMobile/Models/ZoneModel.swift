//
//  Zone.swift
//  
//
//  Created by etud on 14/03/2023.
//

import Foundation
class ZoneModel:ObservableObject,Identifiable, Codable{
    var idzone : Int
    var nomzone:String
    var nbbenevole:Int
    
    


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idzone:Int,nomzone:String,nbbenevole:Int){
        self.idzone=_idzone
        self.nomzone = nomzone
        self.nbbenevole=nbbenevole
        
        
        
    }
}
