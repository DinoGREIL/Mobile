
import Foundation
class ListJourViewModel: ObservableObject {
    
    @Published var jours = [JourViewModel]()
    
    init(listjour: [JourViewModel]){
        self.jours = listjour
    }
    func change(name: String) {
        self.objectWillChange.send()
    }
    func count() -> Int{
        return jours.count
    }
    func remove(atOffsets indexSet : IndexSet) {
        self.jours.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.jours.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : JourState = .ready {
        didSet {
            switch state {
            case .loadingJours:
                debugPrint("state loading UserVM")
            case .loadedJours(let newJours):
                //transformation UserDTO en UserViewModel
                self.jours = newJours.map{ jour in JourViewModel(jour: jour)}
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
