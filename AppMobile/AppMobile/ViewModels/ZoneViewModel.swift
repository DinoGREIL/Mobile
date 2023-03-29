//
//  ZoneViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class ZoneViewModel:Identifiable,Hashable, Equatable{
    static func == (lhs: ZoneViewModel, rhs: ZoneViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : ZoneModel
    @Published var _id : Int
    @Published var nomzone: String
    @Published var nbbenevole: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    init(zone: ZoneModel){
        self.model = zone
        self._id=zone.idzone
        self.nomzone=zone.nomzone
        self.nbbenevole=zone.nbbenevole
    }
    @Published var state : ZoneState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
            case .ready:
                debugPrint("ZoneViewModel: ready state")
                debugPrint("--------------------------------------")
            default:
                break
            }
        }
    }
    
}
