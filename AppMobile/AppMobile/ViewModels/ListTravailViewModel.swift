//
//  ListTravailViewModel.swift
//  AppMobile
//
//  Created by etud on 29/03/2023.
//

import Foundation
class ListTravailViewModel: ObservableObject {
    
    @Published var travails = [TravailViewModel]()
    
    init(list: [TravailViewModel]){
        self.travails = list
    }
    func change(name: String) {
        self.objectWillChange.send()
    }
    func count() -> Int{
        return travails.count
    }
    func remove(atOffsets indexSet : IndexSet) {
        self.travails.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.travails.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : TravailState = .ready {
        didSet {
            switch state {
            case .loadingTravails:
                debugPrint("state loading UserVM")
            case .loadedTravails(let newTravails):
                //transformation UserDTO en UserViewModel
                self.travails = newTravails.map{ travail in TravailViewModel(travail: travail)}
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
