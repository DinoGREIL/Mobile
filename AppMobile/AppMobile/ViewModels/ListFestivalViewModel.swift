
import Foundation
class ListFestivalViewModel: ObservableObject {
    
    @Published var model : ListFestivalModel
    
    init(listfestival: ListFestivalModel){
        self.model = listfestival
    }
        
    
}
