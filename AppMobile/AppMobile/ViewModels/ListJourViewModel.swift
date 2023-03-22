
import Foundation
class ListJourViewModel: ObservableObject {
    
    @Published var model : ListJourModel
    
    init(listjour: ListJourModel){
        self.model = listjour
    }
        
    
}
