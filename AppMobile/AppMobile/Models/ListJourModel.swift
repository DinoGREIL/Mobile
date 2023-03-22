import Foundation
class ListJourModel : ObservableObject {
    
    private(set) var jours = [JourModel]()
    
    init(jours : [JourModel]){
        self.jours = jours
    }
}
