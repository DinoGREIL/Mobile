
import SwiftUI

struct ListeCreneauxView: View {
    @ObservedObject var creneaux : ListCreneauViewModel
    var creneauIntent : CreneauIntent
    @State private var selection:JourViewModel=JourViewModel(jour: JourModel(_idjour: -1, nomjour: "test", debut: "kjsd", fin: "jffsdk", festival: -1))
    @ObservedObject var jours : ListJourViewModel
    var jourIntent : JourIntent
    @State private var datedebut = Date()
    @State private var datefin = Date()
    @State var result:String=""
    init(viewModel : ListCreneauViewModel,viewmodel2:ListJourViewModel){
        self.creneaux = viewModel
        self.creneauIntent = CreneauIntent(model: viewModel)
        self.jours=viewmodel2
        self.jourIntent=JourIntent(model: viewmodel2)
        
    }
    var body: some View {
        VStack {
            beige_fond
                .ignoresSafeArea()
            
            // Your other content here
            // Other layers will respect the safe area edges
            VStack{
                Text("Gestion des Créneaux")
                Divider()
                Spacer()
                VStack{
                    Text(verbatim: "Nombre de creneaux présents:  \(creneaux.count())")
                    
                }
                Spacer()
                VStack {
                    ForEach(creneaux.creneaux, id: \.self) { creneau in
                        HStack{
                            Text(creneau.debut)
                            Text(creneau.fin)
                            
                        }
                        .padding(3)
                    }
                    Spacer()
                }
                .task {
                    await creneauIntent.getCreneaux()
                }
            }
            Text(result)
            DatePicker(
                "Début du créneau",
                selection: $datedebut,
                displayedComponents: [.date,  .hourAndMinute]
            )
            DatePicker(
                "Fin du créneau",
                selection: $datefin,
                displayedComponents: [.date,  .hourAndMinute]
            )
            Picker("Jours", selection: $selection) {
                ForEach(jours.jours, id: \.self) {
                    jour in
                    Text(jour.nomjour).tag(jour)
                    
                    
                                }
                }
                .pickerStyle(.menu)
                .task {
                debugPrint("chargement data ?")
                await jourIntent.getJours()
                }
                .onChange(of: selection) { newValue in
                    Task {}}
            
                Button("Créer un creneau") {
                    Task {
                        print(datefin)
                        print(selection._id)
                        if((selection._id) == -1){
                            result="Veuillez sélectionner un jour"
                        }
                        
                        else{
                            let dateFormatter = DateFormatter()
                            
                            
                            
                            result="Chargement"
                            dateFormatter.dateFormat = "MM/dd/YYYY HH:mm:ss"
                            await creneauIntent.createCreneau(creneau: CreneauModel(_idcreneau: 0, debut: dateFormatter.string(from:datedebut), fin: dateFormatter.string(from:datedebut), jour:Int(selection.model.idjour) ))
                            result="créé"
                            
                        }
                    }}}
                
            }
        }

struct ListeCreneauxView_Previews: PreviewProvider {
    static var previews: some View {
        ListeCreneauxView(viewModel: ListCreneauViewModel(listcreneau: []),viewmodel2: ListJourViewModel(listjour: []))
    }
}
