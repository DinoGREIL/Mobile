
import Foundation
class ListBenevolesViewModel: ObservableObject {
    
    @Published var model : ListBenevoleModel
    
    init(listbenevole: ListBenevoleModel){
        self.model = listbenevole
    }
        
    
}
