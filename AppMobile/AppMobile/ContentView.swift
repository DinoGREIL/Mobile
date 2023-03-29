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

    /* @ObservedObject var festivals =
    ListFestivalViewModel(listfestival: [FestivalViewModel(festival: FestivalModel(_idfestival: "001", nomfestival: "Delta Festival", nbjours: 3, cloture: false)),
        FestivalViewModel(festival: FestivalModel(_idfestival: "002", nomfestival: "TGS", nbjours: 5, cloture: true)),
        FestivalViewModel(festival: FestivalModel(_idfestival: "003", nomfestival: "Eurockéenne", nbjours: 7, cloture: true))]) */

    @ObservedObject var festivals = ListFestivalViewModel(listfestival: [])
    
    var body: some View {
        ZStack {
            beige_fond
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Nom du compte")
                        .padding(.leading,20)
                    Spacer()
                }
                Text("Gestion des Festivals")
                    .font(.system(size: 25))
                    .padding(.top,1)
                Divider()
                Spacer()
                
                VStack{
                    List{
                        ForEach(festivals.festivals,id:\.self){ item in
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Nom : " + item.model.nomfestival);
                                    Text("Durée : \(item.model.nbjours) jours");
                                    if (item.model.cloture == false){
                                        Text("En cours")
                                    }
                                    else{
                                        Text("Cloturé")
                                    }
                                }
                                Spacer()
                                if (item.model.cloture == false){
                                    Button("Modifier", action:{
                                        
                                    })
                                }
                            }
                        }
                    }
                }
            }

        }
        
        
        /*TabView {
            VStack {
                Text("Accueil")
                    .font(.system(size: 25))
                    .padding()
                Divider()
                Spacer()
                // Bleeds into TabView
                Rectangle()
                    .frame(height: 3)
                    .background(vert_nav)
                }
            .tabItem{
                Label("Accueil",systemImage: "house.fill")
            }
         .font(.system(size: 25))
         .padding()
            
            VStack {
                Text("Gestion des Jeux")
                    .font(.system(size: 25))
                    .padding()
                Divider()
                Spacer()
                // Bleeds into TabView
                Rectangle()
                        .frame(height: 3)
                        .background(vert_nav)
                }
                .tabItem {
                    Label("Jeux",systemImage: "checkerboard.rectangle")
                }
                .background(beige_fond)
            
            VStack {
                Text("Gestion des Bénévoles")
                    .font(.system(size: 25))
                    .padding()
                Divider()
                Spacer()
                // Bleeds into TabView
                Rectangle()
                        .frame(height: 3)
                        .background(vert_nav)
                }
                .tabItem {
                    Label("Bénévoles",systemImage: "person.fill")
                }
                .background(beige_fond)
            
            VStack {
                Text("Gestion des Zones")
                    .font(.system(size: 25))
                    .padding()
                Divider()
                Spacer()
                // Bleeds into TabView
                Rectangle()
                    .frame(height: 3)
                    .background(vert_nav)
                
                }
                .tabItem {
                    Label("Zones",systemImage:"mappin.and.ellipse")
                }
                .background(beige_fond)
            
            
        }
        ZStack {
            beige_fond
                .ignoresSafeArea()
            ListeBenevolesView(viewModel: ListBenevolesViewModel(benevoles: []),viewmodel2: ListDisponibleViewModel(list: []))
            //ListeCreneauxView(viewModel: ListCreneauViewModel(listcreneau: []))
            //FestivalsView(viewModel: ListFestivalViewModel(listfestival: []))
            //ListeJoursView(viewModel: ListJourViewModel(listjour: []))
            //ListZonesView(viewModel: ListZoneViewModel(listzone: []))
            // Your other content here
            // Other layers will respect the safe area edges
        } */
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
