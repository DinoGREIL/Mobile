

import SwiftUI

struct FestivalsView: View {
    @ObservedObject var festivals : ListFestivalViewModel
    var festivalIntent : FestivalIntent
    init(viewModel : ListFestivalViewModel){
        self.festivals = viewModel
        self.festivalIntent = FestivalIntent(model: viewModel)
    }
    var body: some View {
        VStack{
            Text("Gestion des Festivals")
            Divider()
            Spacer()
            VStack{
                Text(verbatim: "\(festivals.count())")
                
            }
            Spacer()
            VStack {
                List{
                    ForEach(festivals.festivals, id: \.self) { festival in
                        NavigationLink(value: festival){
                            Text(festival.nomfestival)
                            Text(festival.annee)
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
