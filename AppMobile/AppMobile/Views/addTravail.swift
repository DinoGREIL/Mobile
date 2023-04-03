//
//  addDispoView.swift
//  AppMobile
//
//  Created by etud on 03/04/2023.
//

import Foundation
import SwiftUI
struct addTravail:View{
    
    @ObservedObject var zones : ListZoneViewModel
    var zoneIntent : ZoneIntent
    @ObservedObject var disponibles : ListDisponibleViewModel
    var disponibleIntent: DisponibleIntent
    
    var travailIntent:TravailIntent=TravailIntent(model: ListTravailViewModel(list: []))
    @State private var selectiondisponible:DisponibleViewModel=DisponibleViewModel(disponible: DisponibleModel(creneau: -1, benevole: -1))
    @State private var selectionzone:ZoneViewModel=ZoneViewModel(zone: ZoneModel(_idzone: -1, nomzone: "", nbbenevole: 0))
    init(viewModel : ListZoneViewModel,viewmodel2:ListDisponibleViewModel){
        self.zones = viewModel
        self.zoneIntent = ZoneIntent(model: viewModel)
        self.disponibles = viewmodel2
        self.disponibleIntent = DisponibleIntent(model: viewmodel2)
    }
    var body: some View {
        VStack{
            
            
            
            
            Picker("Disponibilité", selection: $selectiondisponible) {
            ForEach(disponibles.disponibles, id: \.self) {
                disponible in
                Text("\(disponible.benevole) - \(disponible.creneau)").tag(disponible)
                
                
            }
        }
        .pickerStyle(.menu)
        .task {
            debugPrint("chargement data ?")
            await disponibleIntent.getDisponibles()
        }
        .onChange(of: selectiondisponible) { newValue in
            Task {}}
            
            Picker("Zone", selection: $selectionzone) {
            ForEach(zones.zones, id: \.self) {
                zone in
                Text(zone.nomzone).tag(zone)
                
                
            }
        }
        .pickerStyle(.menu)
        .task {
            debugPrint("chargement data ?")
            await zoneIntent.getZones()
        }
        .onChange(of: selectionzone) { newValue in
            Task {}}
        
            
            Button("Assigner") {
                Task {
                    
                    if((selectionzone._id) == -1 ){
                        print("Veuillez sélectionner une zone")
                    }
                    else if((selectiondisponible.benevole) == -1 ){
                        print("Veuillez sélectionner une disponibilité")
                    }
                    else{
                        
                        await travailIntent.createTravail(travail:TravailModel(zone: selectionzone._id, creneau: selectiondisponible.creneau, benevole: selectiondisponible.benevole))
                        print("crée")
                        
                    }
                }}
            
            
            
        }
        
    }
    
}
