


import Foundation
class DisponibleViewModel:Identifiable, Equatable{
    static func == (lhs: DisponibleViewModel, rhs: DisponibleViewModel) -> Bool {
        return (lhs.benevole == rhs.benevole && lhs.creneau == rhs.creneau)
    }
    
    private(set) var model : DisponibleModel
    @Published var benevole : Int
    @Published var creneau: Int
    
    
    init(disponible: DisponibleModel){
        self.model = disponible
        self.benevole=disponible.idbenevole
        self.creneau=disponible.idcreneau
    }
    
    
}
