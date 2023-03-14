//
//  Jeux.swift
//  AppMobile
//
//  Created by etud on 14/03/2023.
//

import Foundation
class JeuModel:ObservableObject{
    var _idjeu : String
    var JeuNom:String
var JeuType:String
var JeuZone:Int
/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idjeu:String,JeuNom:String,JeuType:String,JeuZone:Int){
        self._idjeu = _idjeu
        self.JeuNom = JeuNom
        self.JeuType = JeuType
        self.JeuZone = JeuZone
        
    }
}
