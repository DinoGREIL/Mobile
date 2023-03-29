
import SwiftUI

struct ListeCreneauxView: View {
    @ObservedObject var creneaux : ListCreneauViewModel
    var creneauIntent : CreneauIntent
    init(viewModel : ListCreneauViewModel){
        self.creneaux = viewModel
        self.creneauIntent = CreneauIntent(model: viewModel)
    }
    var body: some View {
        VStack{
            Text("Gestion des Creneaux")
            Divider()
            Spacer()
            VStack{
                Text(verbatim: "\(creneaux.count())")
                
            }
            Spacer()
            VStack {
                List{
                    ForEach(creneaux.creneaux, id: \.self) { creneau in
                        NavigationLink(value: creneau){
                            Text(creneau.debut)
                            Text(creneau.fin)
                        }
                    }
                }
            }
        }.task {
            debugPrint("chargement data ?")
                await creneauIntent.getCreneaux()
        }
    }
}

struct ListeCreneauxView_Previews: PreviewProvider {
    static var previews: some View {
        ListeCreneauxView(viewModel: ListCreneauViewModel(listcreneau: []))
    }
}
