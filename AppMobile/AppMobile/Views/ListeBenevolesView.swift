
import SwiftUI

struct ListeBenevolesView: View {
    @ObservedObject var benevoles : ListBenevolesViewModel
    var benevoleIntent : BenevoleIntent
    
    init(viewModel : ListBenevolesViewModel){
        self.benevoles = viewModel
        self.benevoleIntent = BenevoleIntent(model: viewModel)
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
                    Text(verbatim: verbatim: <#String#>"Nombre de bénévoles : \(benevoles.count()")
                    
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
            }.task {
                debugPrint("chargement data ?")
                    await benevoleIntent.getBenevoles()
            }
            
        }
    }
}

struct ListeBenevolesView_Previews: PreviewProvider {
    static var previews: some View {
        ListeBenevolesView(viewModel: ListBenevolesViewModel(benevoles: []))
    }
}
