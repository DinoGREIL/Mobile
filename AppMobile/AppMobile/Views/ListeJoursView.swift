

import SwiftUI

struct ListeJoursView: View {
    @ObservedObject var jours : ListJourViewModel
    var jourIntent : JourIntent
    init(viewModel : ListJourViewModel){
        self.jours = viewModel
        self.jourIntent = JourIntent(model: viewModel)
    }
    var body: some View {
        VStack{
            Text("Gestion des Jours")
            Divider()
            Spacer()
            VStack{
                Text(verbatim: "\(jours.count())")
                
            }
            Spacer()
            VStack {
                List{
                    ForEach(jours.jours, id: \.self) { jour in
                        NavigationLink(value: jour){
                            Text(jour.nomjour)
                            Text(jour.debut)
                        }
                    }
                }
            }
        }.task {
            debugPrint("chargement data ?")
                await jourIntent.getJours()
        }
    }
}
/*
struct ListeJoursView_Previews: PreviewProvider {
    static var previews: some View {
        ListeCreneauxView(viewModel: ListCreneauViewModel(listcreneau: []))
    }
}
*/
