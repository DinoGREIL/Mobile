import Foundation
class FestivalViewModel:Equatable{
    static func == (lhs: FestivalViewModel, rhs: FestivalViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : FestivalModel
    var _id : String{
        return model._idfestival
    }
    var nomfestival: String{
        return model.nomfestival
    }
    var nbjours: Int{
        return model.nbjours
    }
    
    var cloture:Bool{
        return model.cloture
    }
    init(festival: FestivalModel){
        self.model = festival
    }
    
}

