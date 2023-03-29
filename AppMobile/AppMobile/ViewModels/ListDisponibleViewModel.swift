//
//  ListDisponibleViewModel.swift
//  AppMobile
//
//  Created by etud on 29/03/2023.
//


import Foundation
class ListDisponibleViewModel: ObservableObject {
    
    @Published var disponibles = [DisponibleViewModel]()
    
    init(list: [DisponibleViewModel]){
        self.disponibles = list
    }
    func change(name: String) {
        self.objectWillChange.send()
    }
    func count() -> Int{
        return disponibles.count
    }
    func remove(atOffsets indexSet : IndexSet) {
        self.disponibles.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }
    
    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.disponibles.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    @Published var state : DisponibleState = .ready {
        didSet {
            switch state {
            case .loadingDisponibles:
                debugPrint("state loading UserVM")
            case .loadedDisponibles(let newDisponibles):
                //transformation UserDTO en UserViewModel
                self.disponibles = newDisponibles.map{ disponible in DisponibleViewModel(disponible: disponible)}
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
