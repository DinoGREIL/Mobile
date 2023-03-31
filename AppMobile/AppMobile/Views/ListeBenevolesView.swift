
import SwiftUI

class BenevoleSettings: ObservableObject{
    @Published var name = ""
}

struct ListeBenevolesView: View {
    @StateObject var settings = BenevoleSettings()

    @State var email:String=""
    @State var nombenevole:String=""
    @State var prenom:String=""
    @State var password:String=""
    @State var result:String=""
    
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
        NavigationStack{
            VStack {
                beige_fond
                    .ignoresSafeArea()
                
                // Your other content here
                // Other layers will respect the safe area edges
                Text(result)
                TextField("Nom",text :$nombenevole)
                    .padding()
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    ).padding(.bottom,30)
                
                
                TextField("Prenom",text :$prenom)
                    .padding()
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    ).padding(.bottom,30)
                
                
                TextField("Email",text :$email)
                    .padding()
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    ).padding(.bottom,30)
                
                
                
                TextField("Mot de passe",text :$password)
                    .padding()
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                
                Button("Créer un bénévole") {
                    Task {
                        if(nombenevole==""){
                            result="Veuillez mettre un nom"
                        }
                        else if(prenom==""){
                            result="Veuillez mettre un prenom"
                        }
                        else if(email==""){
                            result="Veuillez mettre un email"
                        }
                        else if(password==""){result="Veuillez mettre un mot de passe"}
                        else{let message:String = await benevoleIntent.createBenevole(benevole:BenevoleModel(_idbenevole: 0, BenevoleNom: nombenevole, BenevolePrenom: prenom, BenevoleMail: email, admin: false, password: password))
                            result=message}
                        
                        
                        
                    }
                }
                
                
                
                VStack{
                    Text("Gestion des Bénévoles")
                    Divider()
                    Spacer()
                    VStack{
                        Text(verbatim: "Nombre de bénévoles présents:  \(benevoles.count())")
                        
                    }
                    Spacer()
                    VStack {
                        ForEach(benevoles.benevoles, id: \.self) { benevole in
                            HStack{
                                Text(benevole.BenevoleNom)
                                Text(benevole.BenevolePrenom)
                                NavigationLink(destination: BenevoleView()){
                                    Text("Détail")
                                }.simultaneousGesture(TapGesture().onEnded{
                                    settings.name = benevole.BenevoleNom
                                })
                            }
                            .padding(3)
                        }
                        Spacer()
                    }
                }
                .task{
                    debugPrint("chargement data dispo");
                    print(await benevoleIntent.getBenevoles())
                }
                
                
                
            }
        }
        .environmentObject(settings)
    }
}

struct ListeBenevolesView_Previews: PreviewProvider {
    static var previews: some View {
        ListeBenevolesView(viewModel: ListBenevolesViewModel(benevoles: []),viewmodel2: ListDisponibleViewModel(list: []))
    }
}
