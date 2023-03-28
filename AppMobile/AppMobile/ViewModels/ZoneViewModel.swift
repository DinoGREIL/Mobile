//
//  ZoneViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class ZoneViewModel:Identifiable, Equatable{
    static func == (lhs: ZoneViewModel, rhs: ZoneViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : ZoneModel
    @Published var _id : Int
    @Published var nomzone: String
    @Published var nbbenevole: Int
    
    
    init(zone: ZoneModel){
        self.model = zone
        self._id=zone.idzone
        self.nomzone=zone.nomzone
        self.nbbenevole=zone.nbbenevole
    }
    
}
