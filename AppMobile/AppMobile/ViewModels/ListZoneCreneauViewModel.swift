//
//  ListZoneCreneau.swift
//  AppMobile
//
//  Created by etud on 29/03/2023.
//

import Foundation
class ListZoneCreneauViewModel: ObservableObject {
    
    @Published var zonecreneau = [ZoneCreneauViewModel]()
    
    init(list: [ZoneCreneauViewModel]){
        self.zonecreneau = list
    }
    func change(name: String) {
        self.objectWillChange.send()
    }
    func count() -> Int{
        return zonecreneau.count
    }
    func remove(atOffsets indexSet : IndexSet) {
        self.zonecreneau.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.zonecreneau.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : ZoneCreneauState = .ready {
        didSet {
            switch state {
            case .loadingZoneCreneau:
                debugPrint("state loading UserVM")
            case .loadedZoneCreneau(let newZoneCreneau):
                //transformation UserDTO en UserViewModel
                self.zonecreneau = newZoneCreneau.map{ zonecreneau in ZoneCreneauViewModel(zonecreneau: zonecreneau)}
                debugPrint("zonecreneau chargée")
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
