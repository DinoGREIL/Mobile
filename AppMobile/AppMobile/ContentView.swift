//
//  ContentView.swift
//  AppMobile
//
//  Created by etud on 14/03/2023.
//

import SwiftUI

let beige_fond = Color(red: 0.9607843137, green: 0.9490196078, blue: 0.8431372549);
let vert_nav = Color(red: 0.3882352941, green: 0.831372549, blue: 0.4431372549)
struct ContentView: View {
    @ObservedObject var festivals = ListFestivalViewModel(listfestival: [])
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Accueil")
                    .font(.system(size: 25))
                    .padding()
                Divider()
                Spacer()
            }
            .background(beige_fond)
            VStack{
                NavigationLink("Gestion des festivals"){
                    FestivalsView(viewModel: ListFestivalViewModel(listfestival: []))
                }
                NavigationLink("Gestion des Jours"){
                    ListeJoursView(viewModel: ListJourViewModel(listjour: []),viewModel2: ListFestivalViewModel(listfestival: []))
                }
                NavigationLink("Gestion des Creneaux"){
                    ListeCreneauxView(viewModel: ListCreneauViewModel(listcreneau: []),viewmodel2:ListJourViewModel(listjour: []))
                }
                NavigationLink("Gestion des Bénévoles"){
                    ListeBenevolesView(viewModel: ListBenevolesViewModel(benevoles: []),viewmodel2: ListDisponibleViewModel(list: []))
                }
                NavigationLink("Gestion des Zones"){
                    ListZonesView(viewModel: ListZoneViewModel(listzone: []))
                }
                Spacer()
            }
        }
        
        ZStack {
            beige_fond
                .ignoresSafeArea()
            //ListeBenevolesView(viewModel: ListBenevolesViewModel(benevoles: []),viewmodel2: ListDisponibleViewModel(list: []))
            //ListeCreneauxView(viewModel: ListCreneauViewModel(listcreneau: []),viewmodel2:ListJourViewModel(listjour: []))
            //FestivalsView(viewModel: ListFestivalViewModel(listfestival: []))
            ListeJoursView(viewModel: ListJourViewModel(listjour: []),viewModel2: ListFestivalViewModel(listfestival: []))
            //ListZonesView(viewModel: ListZoneViewModel(listzone: []))
            // Your other content here
            // Other layers will respect the safe area edges
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

