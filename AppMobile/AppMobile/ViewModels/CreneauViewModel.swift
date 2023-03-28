//
//  CreneauViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class CreneauViewModel:Identifiable,Hashable, Equatable{
    static func == (lhs: CreneauViewModel, rhs: CreneauViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : CreneauModel
    @Published var _id : Int
    @Published var debut: String
    @Published var fin: String
    @Published var jour:Int
    
    init(creneau: CreneauModel){
        self.model = creneau
        self._id=creneau.idcreneau
        self.debut=creneau.debut
        self.fin=creneau.fin
        self.jour=creneau.jour
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    @Published var state : CreneauState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
            case .ready:
                debugPrint("CreneauViewModel: ready state")
                debugPrint("--------------------------------------")
            default:
                break
            }
        }
    }
    
}
