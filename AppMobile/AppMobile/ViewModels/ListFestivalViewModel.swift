
import Foundation
class ListFestivalViewModel: ObservableObject {
    
    @Published var festivals = [FestivalViewModel]()
    
    init(listfestival: [FestivalViewModel]){
        self.festivals = listfestival
    }
        
    func change(name: String) {
        self.objectWillChange.send()
    }
    
    func remove(atOffsets indexSet : IndexSet) {
        self.festivals.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.festivals.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : FestivalState = .ready {
        didSet {
            switch state {
            case .loadingFestivals:
                debugPrint("state loading UserVM")
            case .loadedFestivals(let newFestivals):
                //transformation UserDTO en UserViewModel
                self.festivals = newFestivals.map{ festival in FestivalViewModel(festival: festival)}
                debugPrint("jai charge les donnees")
                self.state = .ready
            case .error:
                debugPrint("error")
                self.state = .ready
            case .ready:
                debugPrint("TrackViewModel: ready state")
                debugPrint("--------------------------------------")
            default:
                break
            }
        }
    }
}
