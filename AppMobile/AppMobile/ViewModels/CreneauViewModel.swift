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
    var _id : String{
        return model._idcreneau
    }
    var debut: String{
        return model.debut
    }
    var fin: String{
        return model.fin
    }
    var jour:JourModel{
        return model.jour
    }
    
    init(creneau: CreneauModel){
        self.model = creneau
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
