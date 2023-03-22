

//
//  TravailViewModel.swift
//  AppMobile
//
//  Created by etud on 21/03/2023.
//

import Foundation
class ZoneFestivalViewModel:Identifiable, Equatable{
    static func == (lhs: ZoneFestivalViewModel, rhs: ZoneFestivalViewModel) -> Bool {
        return (lhs.zone._idzone == rhs.zone._idzone && lhs.festival._idfestival == rhs.festival._idfestival)
    }
    
    private(set) var model : ZoneFestivalModel
    var zone : ZoneModel{
        return model.zone
    }
    var festival: FestivalModel{
        return model.festival
    }
    
    
    init(zonefestival: ZoneFestivalModel){
        self.model = zonefestival
    }
    
}
