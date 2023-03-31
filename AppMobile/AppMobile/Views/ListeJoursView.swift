

import SwiftUI

struct ListeJoursView: View {
    @ObservedObject var jours : ListJourViewModel
    var jourIntent : JourIntent
    @State var nomjour:String=""
    @State private var datedebut = Date()
    @State private var datefin = Date()
    @State var result:String=""
    @State var selection:FestivalViewModel?
    @ObservedObject var festivals : ListFestivalViewModel
    var festivalIntent : FestivalIntent
    
    init(viewModel : ListJourViewModel,viewModel2:ListFestivalViewModel){
        self.jours = viewModel
        self.jourIntent = JourIntent(model: viewModel)
        self.festivals = viewModel2
        self.festivalIntent = FestivalIntent(model: viewModel2)
    }
    var body: some View {
        /*
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
        }*/
        VStack{
            Text(result)
            TextField("Nom",text :$nomjour)
                .padding()
                .cornerRadius(5.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.blue, lineWidth: 1)
                ).padding(.bottom,30)
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
            List(festivals.festivals, id: \.self, selection: $selection) { festival in

                Text(festival.nomfestival)
                            }
            
                        .navigationTitle("Contacts")
                        .toolbar {
                            // 1
                            EditButton()

                        }
            Text("\(selection?.nomfestival ?? "N/A")")
        }
        .task {
            await festivalIntent.getFestivals()
        }
        Button("Créer un jour") {
            Task {
                
                if((selection) != nil){
                    result="Veuillez selectionner un festival"
                }
                
                else{
                    let dateFormatter = DateFormatter()
                    
                    
                    
                    result=""
                    dateFormatter.dateFormat = "YY, MMM d, HH:mm:ss"
                    await jourIntent.createJour(jour: JourModel(_idjour: 0, nomjour: nomjour, debut: dateFormatter.string(from:datedebut), fin: dateFormatter.string(from:datedebut), festival: selection!._id))
                    result="creer"
                    
                }
            }
        }
        
    }}
/*
struct ListeJoursView_Previews: PreviewProvider {
    static var previews: some View {
        ListeCreneauxView(viewModel: ListCreneauViewModel(listcreneau: []))
    }
}
*/
