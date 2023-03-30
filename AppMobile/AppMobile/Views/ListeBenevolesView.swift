
import SwiftUI

struct ListeBenevolesView: View {
    @ObservedObject var benevoles : ListBenevolesViewModel
    var benevoleIntent : BenevoleIntent
    @ObservedObject var disponibles : ListDisponibleViewModel
    var disponibleIntent : DisponibleIntent
    init(viewModel : ListBenevolesViewModel,viewmodel2:ListDisponibleViewModel){
        self.benevoles = viewModel
        self.benevoleIntent = BenevoleIntent(model: viewModel)
        self.disponibles = viewmodel2
        self.disponibleIntent = DisponibleIntent(model: viewmodel2)
    }
    var body: some View {
        ZStack {
            beige_fond
                .ignoresSafeArea()
            
            // Your other content here
            // Other layers will respect the safe area edges
            VStack{
                Text("Gestion des Bénévoles")
                Divider()
                Spacer()
                VStack{
                    Text(verbatim: "\(benevoles.count())")
                    
                }
                Spacer()
                VStack {
                    List{
                        ForEach(benevoles.benevoles, id: \.self) { benevole in
                            NavigationLink(value: benevole){
                                Text(benevole.BenevoleNom)
                                Text(benevole.BenevolePrenom)
                            }
                        }
                    }
                    
                }
            }
            .task{
                debugPrint("chargement data dispo");
                print(await benevoleIntent.getBenevoles())
            }
            
            
            
        }
    }
}

struct ListeBenevolesView_Previews: PreviewProvider {
    static var previews: some View {
        ListeBenevolesView(viewModel: ListBenevolesViewModel(benevoles: []),viewmodel2: ListDisponibleViewModel(list: []))
    }
}
