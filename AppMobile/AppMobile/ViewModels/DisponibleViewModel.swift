


import Foundation
class DisponibleViewModel:Identifiable, Equatable,Hashable{
    static func == (lhs: DisponibleViewModel, rhs: DisponibleViewModel) -> Bool {
        return (lhs.benevole == rhs.benevole && lhs.creneau == rhs.creneau)
    }
    
    private(set) var model : DisponibleModel
    @Published var benevole : Int
    @Published var creneau: Int
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    init(disponible: DisponibleModel){
        self.model = disponible
        self.benevole=disponible.idbenevole
        self.creneau=disponible.idcreneau
    }
    
    
}
