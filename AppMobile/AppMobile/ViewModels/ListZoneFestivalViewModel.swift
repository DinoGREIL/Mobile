//
//  ListZoneFestivalViewModel.swift
//  AppMobile
//
//  Created by etud on 29/03/2023.
//

import Foundation
class ListZoneFestivalViewModel: ObservableObject {
    
    @Published var zonefestival = [ZoneFestivalViewModel]()
    
    init(list: [ZoneFestivalViewModel]){
        self.zonefestival = list
    }
    func change(name: String) {
        self.objectWillChange.send()
    }
    func count() -> Int{
        return zonefestival.count
    }
    func remove(atOffsets indexSet : IndexSet) {
        self.zonefestival.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.zonefestival.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : ZoneFestivalState = .ready {
        didSet {
            switch state {
            case .loadingZoneFestival:
                debugPrint("state loading zonefestival")
            case .loadedZoneFestival(let newZoneFestivals):
                //transformation UserDTO en UserViewModel
                self.zonefestival = newZoneFestivals.map{ zonefestival in ZoneFestivalViewModel(zonefestival: zonefestival)}
                debugPrint("zonefestival chargé")
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
