


import Foundation
class DisponibleViewModel:Identifiable, Equatable{
    static func == (lhs: DisponibleViewModel, rhs: DisponibleViewModel) -> Bool {
        return (lhs.benevole.idbenevole == rhs.benevole.idbenevole && lhs.creneau.idcreneau == rhs.creneau.idcreneau)
    }
    
    private(set) var model : DisponibleModel
    var benevole : BenevoleModel{
        return model.benevole
    }
    var creneau: CreneauModel{
        return model.creneau
    }
    
    
    init(disponible: DisponibleModel){
        self.model = disponible
    }
    
    
}
