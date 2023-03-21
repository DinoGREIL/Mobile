//
//  Festival.swift
//  AppMobile
//
//  Created by etud on 16/03/2023.
//

import Foundation
class FestivalModel:ObservableObject{
    var _idfestival : String
    var nomfestival:String
    var nbjours:Int
    
    
    

/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idfestival:String,nomfestival:String,nbjours:Int){
        self._idfestival=_idfestival
        self.nomfestival=nomfestival
        self.nbjours = nbjours
        
    }
}
