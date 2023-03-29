

import SwiftUI

struct FestivalsView: View {


    
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

    @ObservedObject var festivals : ListFestivalViewModel
    var festivalIntent : FestivalIntent
    init(viewModel : ListFestivalViewModel){
        self.festivals = viewModel
        self.festivalIntent = FestivalIntent(model: viewModel)
    }
    
                        }
                    }
                }
            }

        }.task {
            debugPrint("chargement data ?")
                await festivalIntent.getFestivals()
        }
    }

}

struct FestivalsView_Previews: PreviewProvider {
    static var previews: some View {

        FestivalsView(viewModel: ListFestivalViewModel(listfestival: []))

    }
}
