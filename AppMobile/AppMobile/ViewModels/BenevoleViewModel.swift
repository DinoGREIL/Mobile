//
//  BenevoleViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//
enum BenevoleState {
    case ready
    case changingName(String)
    case error
    case loadingBenevoles
    case loadedBenevoles([BenevoleModel])
    
}
import Foundation
class BenevoleViewModel:Identifiable,Hashable, Equatable{
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
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    @Published var state : BenevoleState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
            case .ready:
                debugPrint("BenevoleViewModel: ready state")
                debugPrint("--------------------------------------")
            default:
                break
            }
        }
    }
    
}
