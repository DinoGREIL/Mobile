

import Foundation
class FestivalViewModel:Identifiable, Hashable,Equatable{
    static func == (lhs: FestivalViewModel, rhs: FestivalViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    private(set) var model : FestivalModel
    @Published var _id : Int
    @Published var nomfestival: String
    @Published var nbjours: Int
    
    @Published var cloture:Bool
    
    @Published var annee: String
    init(festival: FestivalModel){
        self.model = festival
        self._id=festival.idfestival
        self.nomfestival=festival.nomfestival
        self.nbjours=festival.nbjour
        self.cloture=festival.cloturer
        self.annee=festival.annee
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

