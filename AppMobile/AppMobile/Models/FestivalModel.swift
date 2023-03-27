//
//  Festival.swift
//  AppMobile
//
//  Created by etud on 16/03/2023.
//

import Foundation
class FestivalModel:ObservableObject,Identifiable, Codable{
    var _idfestival : String
    var nomfestival:String
    var nbjours:Int
    var cloture:Bool
    var annee: String
    
    

/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idfestival:String,nomfestival:String,nbjours:Int,cloture:Bool, annee: String){
        self._idfestival=_idfestival
        self.nomfestival=nomfestival
        self.nbjours = nbjours
        self.cloture = cloture
        self.annee = annee
        
    }
}
