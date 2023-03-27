//
//  benevole.swift
//  AppMobile
//
//  Created by etud on 14/03/2023.
//

import Foundation

class BenevoleModel:ObservableObject,Identifiable, Codable{
    var idbenevole : Int
    var nombenevole:String
var prenom:String
var email:String
    
    var admin: Bool
    var password:String
/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(_idbenevole:Int,BenevoleNom:String,BenevolePrenom:String,BenevoleMail:String,admin:Bool,password:String){
        self.idbenevole = _idbenevole
        self.nombenevole = BenevoleNom
        self.prenom = BenevolePrenom
        self.email = BenevoleMail
        
        self.admin=admin
        self.password=password
        
    }
}

