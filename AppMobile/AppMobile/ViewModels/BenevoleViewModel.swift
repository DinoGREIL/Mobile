//
//  BenevoleViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class BenevoleViewModel:Equatable{
    static func == (lhs: BenevoleViewModel, rhs: BenevoleViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : BenevoleModel
    var _id : String{
        return model._idbenevole
    }
    var BenevoleNom: String{
        return model.BenevoleNom
    }
    var BenevolePrenom: String{
        return model.BenevolePrenom
    }
    
    var BenevoleMail: String{
        return model.BenevoleMail
    }
    var admin: Bool{
        return model.admin
    }
    var password: String{
        return model.password
    }
    init(benevole: BenevoleModel){
        self.model = benevole
    }
    
}
