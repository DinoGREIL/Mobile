


import Foundation
class DisponibleViewModel:Identifiable, Equatable{
    static func == (lhs: DisponibleViewModel, rhs: DisponibleViewModel) -> Bool {
        return (lhs.benevole.idbenevole == rhs.benevole.idbenevole && lhs.creneau.idcreneau == rhs.creneau.idcreneau)
    }
    
    private(set) var model : DisponibleModel
    @Published var benevole : BenevoleModel
    @Published var creneau: CreneauModel
    
    
    init(disponible: DisponibleModel){
        self.model = disponible
        self.benevole=disponible.benevole2
        self.creneau=disponible.creneau
    }
    
    
}
