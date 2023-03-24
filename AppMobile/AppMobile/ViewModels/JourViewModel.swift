//
//  JourViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class JourViewModel:Identifiable, Hashable,Equatable{
    static func == (lhs: JourViewModel, rhs: JourViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : JourModel
    var _id : String{
        return model._idjour
    }
    var nomjour: String{
        return model.nomjour
    }
    var debut: TimeInterval{
        return model.debut
    }
    var fin:TimeInterval{
        return model.fin
    }
    var festival:FestivalModel{
        return model.festival
    }
    init(jour: JourModel){
        self.model = jour
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    @Published var state : JourState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
            case .ready:
                debugPrint("JourViewModel: ready state")
                debugPrint("--------------------------------------")
            default:
                break
            }
        }
    }
}



