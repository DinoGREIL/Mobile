
//
//  TravailViewModel.swift
//  AppMobile
//
//  Created by etud on 21/03/2023.
//

import Foundation
class ZoneCreneauViewModel:Identifiable, Equatable{
    static func == (lhs: ZoneCreneauViewModel, rhs: ZoneCreneauViewModel) -> Bool {
        return (lhs.zone == rhs.zone && lhs.creneau == rhs.creneau)
    }
    
    private(set) var model : ZoneCreneauModel
    @Published var zone : Int
    @Published var creneau: Int
    
    
    init(zonecreneau: ZoneCreneauModel){
        self.model = zonecreneau
        self.zone=zonecreneau.zone
        self.creneau=zonecreneau.creneau
    }
    
}
