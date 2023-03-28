

import Foundation
class ListCreneauViewModel: ObservableObject {
    
    @Published var creneaux = [CreneauViewModel]()
    
    init(listcreneau: [CreneauViewModel]){
        self.creneaux = listcreneau
    }
        
    func change(name: String) {
        self.objectWillChange.send()
    }
    func count() -> Int{
        return creneaux.count
    }
    func remove(atOffsets indexSet : IndexSet) {
        self.creneaux.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.creneaux.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : CreneauState = .ready {
        didSet {
            switch state {
            case .loadingCreneaux:
                debugPrint("state loading UserVM")
            case .loadedCreneaux(let newCreneaux):
                //transformation UserDTO en UserViewModel
                self.creneaux = newCreneaux.map{ creneau in CreneauViewModel(creneau: creneau)}
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
