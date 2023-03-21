//
//  JourViewModel.swift
//  AppMobile
//
//  Created by etud on 17/03/2023.
//

import Foundation
class JourViewModel:Identifiable, Equatable{
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
    var debut: NSTimeInterval{
        return model.debut
    }
    var fin:NSTimeInterval{
        return model.fin
    }
    var festival:FestivalModel{
        return model.festival
    }
    init(jour: JourModel){
        self.model = jour
    }
    
}



