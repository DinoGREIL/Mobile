

//
//  TravailViewModel.swift
//  AppMobile
//
//  Created by etud on 21/03/2023.
//

import Foundation
class ZoneFestivalViewModel:Identifiable, Equatable{
    static func == (lhs: ZoneFestivalViewModel, rhs: ZoneFestivalViewModel) -> Bool {
        return (lhs.zone == rhs.zone && lhs.festival == rhs.festival)
    }
    
    private(set) var model : ZoneFestivalModel
    @Published var zone : Int
    
    @Published var festival: Int
    
    
    init(zonefestival: ZoneFestivalModel){
        self.model = zonefestival
        self.zone=zonefestival.zone
        self.festival=zonefestival.festival
    }
    
}
