

import SwiftUI

struct FestivalsView: View {

    @ObservedObject var festivals =
    ListFestivalViewModel(listfestival: [FestivalViewModel(festival: FestivalModel(_idfestival: "001", nomfestival: "Delta Festival", nbjours: 3, cloture: false,annee: "")),
        FestivalViewModel(festival: FestivalModel(_idfestival: "002", nomfestival: "TGS", nbjours: 5, cloture: true, annee: "")),
        FestivalViewModel(festival: FestivalModel(_idfestival: "003", nomfestival: "Eurockéenne", nbjours: 7, cloture: true,annee: ""))])

    var body: some View {
        NavigationView {

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
                                    if (item.model.cloture == false){
                                        NavigationLink(destination: FestivalView()) {
                                            Text("Voir le festival")
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}

struct FestivalsView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalsView()
    }
}
