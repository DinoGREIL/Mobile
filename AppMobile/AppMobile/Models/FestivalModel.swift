//
//  Festival.swift
//  AppMobile
//
//  Created by etud on 16/03/2023.
//

import Foundation
class FestivalModel:ObservableObject,Identifiable, Codable{
    var idfestival : Int
    var nomfestival:String
    var nbjour:Int
    var cloturer:Bool
    var annee: String
    
    

/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idfestival:Int,nomfestival:String,nbjours:Int,cloturer:Bool, annee: String){
        self.idfestival=_idfestival
        self.nomfestival=nomfestival
        self.nbjour = nbjours
        self.cloturer = cloturer
        self.annee = annee
        
    }
}
