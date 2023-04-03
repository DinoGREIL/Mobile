//
//  addDispoView.swift
//  AppMobile
//
//  Created by etud on 03/04/2023.
//

import Foundation
import SwiftUI
struct addDispo:View{
    
    @ObservedObject var creneaux : ListCreneauViewModel
    var creneauIntent : CreneauIntent
    @ObservedObject var benevoles : ListBenevolesViewModel
    var benevoleIntent : BenevoleIntent
    @State var result:String=""
    var disponibleIntent:DisponibleIntent=DisponibleIntent(model: ListDisponibleViewModel(list: []))
    @State private var selectioncreneau:CreneauViewModel=CreneauViewModel(creneau: CreneauModel(_idcreneau: -1, debut: "", fin: "", jour: -1))
    @State private var selectionbenevole:BenevoleViewModel=BenevoleViewModel(benevole: BenevoleModel(_idbenevole: -1, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: ""))
    init(viewModel : ListBenevolesViewModel,viewmodel2:ListCreneauViewModel){
        self.benevoles = viewModel
        self.benevoleIntent = BenevoleIntent(model: viewModel)
        self.creneaux = viewmodel2
        self.creneauIntent = CreneauIntent(model: viewmodel2)
    }
    var body: some View {
        VStack{
            
            
            
            Text(result)
            Picker("Creneaux", selection: $selectioncreneau) {
            ForEach(creneaux.creneaux, id: \.self) {
                creneau in
                Text(creneau.debut+" - "+creneau.fin).tag(creneau)
                
                
            }
        }
        .pickerStyle(.menu)
        .task {
            debugPrint("chargement data ?")
            await creneauIntent.getCreneaux()
        }
        .onChange(of: selectioncreneau) { newValue in
            Task {}}
            
            Picker("Creneaux", selection: $selectionbenevole) {
            ForEach(benevoles.benevoles, id: \.self) {
                benevole in
                Text(benevole.BenevoleNom+" - "+benevole.BenevolePrenom).tag(benevole)
                
                
            }
        }
        .pickerStyle(.menu)
        .task {
            debugPrint("chargement data ?")
            await benevoleIntent.getBenevoles()
        }
        .onChange(of: selectionbenevole) { newValue in
            Task {}}
        
            
            Button("Créer une disponibilité") {
                Task {
                    
                    if((selectionbenevole._id) == -1 ){
                        result="Veuillez sélectionner un benevole"
                    }
                    else if((selectioncreneau._id) == -1 ){
                        result="Veuillez sélectionner un creneau"
                    }
                    else{
                        result="Chargement"
                        await disponibleIntent.createDisponible(disponible: DisponibleModel(creneau: selectioncreneau._id, benevole: selectionbenevole._id))
                        result="Disponibilité crée"
                        
                    }
                }}
            NavigationLink("Assigner"){
                addTravail(viewModel: ListZoneViewModel(listzone: []), viewmodel2: ListDisponibleViewModel(list: []))
            }
            
            
        }
        
    }
    
}
