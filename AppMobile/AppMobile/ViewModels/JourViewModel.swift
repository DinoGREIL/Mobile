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
    @Published var _id : Int
    @Published var nomjour: String
    @Published var debut: TimeInterval
    @Published var fin:TimeInterval
    @Published var festival:Int
    init(jour: JourModel){
        self.model = jour
        self._id=jour.idjour
        self.nomjour=jour.nomjour
        self.debut=jour.debut
        self.fin=jour.fin
        self.festival=jour.festival
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



