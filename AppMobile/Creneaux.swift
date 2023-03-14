//
//  Creneaux.swift
//  
//
//  Created by etud on 14/03/2023.
//

import Foundation
class CreneauxModel:ObservableObject{
    var BenevoleNom:String
var BenevolePrenom:String
var BenevoleMail:String
/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(BenevoleNom:String,BenevolePrenom:String,BenevoleMail:String){
        self.BenevoleNom = BenevoleNom
        self.BenevolePrenom = BenevolePrenom
        self.BenevoleMail = BenevoleMail
        
    }
}
