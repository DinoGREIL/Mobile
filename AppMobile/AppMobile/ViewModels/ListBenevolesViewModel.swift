
import Foundation
class ListBenevolesViewModel: ObservableObject {
    
    private(set) var benevoles = [BenevoleViewModel]()
    
    init(benevoles: [BenevoleViewModel]){
        self.benevoles = benevoles
    }
    func count() -> Int{
        return benevoles.count
    }
    func change(name: String) {
        self.objectWillChange.send()
    }
    
    func remove(atOffsets indexSet : IndexSet) {
        self.benevoles.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.benevoles.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : BenevoleState = .ready {
        didSet {
            switch state {
            case .loadingBenevoles:
                debugPrint("state loading UserVM")
            case .loadedBenevoles(let newBenevoles):
                //transformation UserDTO en UserViewModel
                self.benevoles = newBenevoles.map{ benevole in BenevoleViewModel(benevole: benevole)}
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
