

import Foundation
class FestivalViewModel:Identifiable, Hashable,Equatable{
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
    
    var annee: String{
        return model.annee
    }
    
    init(festival: FestivalModel){
        self.model = festival
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    @Published var state : FestivalState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
            case .ready:
                debugPrint("FestivalViewModel: ready state")
                debugPrint("--------------------------------------")
            default:
                break
            }
        }
    }
}

