//
//  BenevoleViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class BenevoleViewModel:Identifiable,Hashable, Equatable{
    static func == (lhs: BenevoleViewModel, rhs: BenevoleViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : BenevoleModel
    @Published var _id : Int
    @Published var BenevoleNom: String
    @Published var BenevolePrenom: String
    
    @Published var BenevoleMail: String
    @Published var admin: Bool
    @Published var password: String
    init(benevole: BenevoleModel){
        self.model = benevole
        self._id=benevole.idbenevole
        self.BenevoleNom=benevole.nombenevole
        self.BenevolePrenom=benevole.prenom
        self.BenevoleMail=benevole.email
        self.admin=benevole.admin
        self.password=benevole.password
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
