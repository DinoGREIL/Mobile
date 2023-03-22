import Foundation
class ListZoneModel : ObservableObject {
    
    private(set) var zones = [ZoneModel]()
    
    init(zones : [ZoneModel]){
        self.zones = zones
    }
}
