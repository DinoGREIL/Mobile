

import Foundation
class ListCreneauViewModel: ObservableObject {
    
    @Published var creneaux : [CreneauViewModel]
    
    init(listcreneau: [CreneauViewModel]){
        self.creneaux = listcreneau
    }
        
    
}
