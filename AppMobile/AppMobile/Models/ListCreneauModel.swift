import Foundation
class ListCreneauModel : ObservableObject {
    
    private(set) var creneaux = [CreneauModel]()
    
    init(creneaux : [CreneauModel]){
        self.creneaux = creneaux
    }
}
