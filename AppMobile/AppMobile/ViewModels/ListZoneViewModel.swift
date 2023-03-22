
import Foundation
class ListZoneViewModel: ObservableObject {
    
    @Published var model : ListZoneModel
    
    init(listzone: ListZoneModel){
        self.model = listzone
    }
        
    
}
