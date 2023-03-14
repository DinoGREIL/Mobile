//
//  benevole.swift
//  AppMobile
//
//  Created by etud on 14/03/2023.
//

import Foundation
class BenevoleModel:ObservableObject{
    var _idbenevole : String
    var BenevoleNom:String
var BenevolePrenom:String
var BenevoleMail:String
/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idbenevole:String,BenevoleNom:String,BenevolePrenom:String,BenevoleMail:String){
        self._idbenevole = _idbenevole
        self.BenevoleNom = BenevoleNom
        self.BenevolePrenom = BenevolePrenom
        self.BenevoleMail = BenevoleMail
        
    }
}

