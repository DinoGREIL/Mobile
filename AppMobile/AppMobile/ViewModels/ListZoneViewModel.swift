
import Foundation
class ListZoneViewModel: ObservableObject {
    
    @Published var zones = [ZoneViewModel]()
    
    init(listzone: [ZoneViewModel]){
        self.zones = listzone
    }
    func change(name: String) {
        self.objectWillChange.send()
    }
    func count() -> Int{
        return zones.count
    }
    func remove(atOffsets indexSet : IndexSet) {
        self.zones.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.zones.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : ZoneState = .ready {
        didSet {
            switch state {
            case .loadingZones:
                debugPrint("state loading zones")
            case .loadedZones(let newZones):
                //transformation UserDTO en UserViewModel
                self.zones = newZones.map{ zone in ZoneViewModel(zone: zone)}
                debugPrint("zones chargées")
                self.state = .ready
            case .error:
                debugPrint("error")
                self.state = .ready
            case .ready:
                debugPrint("ready state")
                debugPrint("--------------------------------------")
            default:
                break
            }
        }
    }
    
}
