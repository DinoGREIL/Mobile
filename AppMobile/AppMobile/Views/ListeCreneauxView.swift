
import SwiftUI

struct ListeCreneauxView: View {
    @ObservedObject var creneaux : ListCreneauViewModel
    var creneauIntent : CreneauIntent
    @State private var selection:JourViewModel? //JourModel=JourModel(_idjour: 0, nomjour: "", debut: "", fin: "", festival: 0)
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
                    
                    Text(jour.nomjour).tag(jour.nomjour)
                    
                    
                                }
                }
                .pickerStyle(.menu)
                .task {
                debugPrint("chargement data ?")
                await jourIntent.getJours()
                }
                Button("Créer un creneau") {
                    Task {
                        
                        if((selection) != nil){
                            result="Veuillez selectionner un jour"
                        }
                        
                        else{
                            let dateFormatter = DateFormatter()
                            
                            
                            
                            result=""
                            dateFormatter.dateFormat = "YY, MMM d, HH:mm:ss"
                            await creneauIntent.createCreneau(creneau: CreneauModel(_idcreneau: 0, debut: dateFormatter.string(from:datedebut), fin: dateFormatter.string(from:datedebut), jour:Int(selection?.model.idjour ?? 1) ))
                            result="creer"
                            
                        }
                    }}}
                
            }
        }

struct ListeCreneauxView_Previews: PreviewProvider {
    static var previews: some View {
        ListeCreneauxView(viewModel: ListCreneauViewModel(listcreneau: []),viewmodel2: ListJourViewModel(listjour: []))
    }
}
