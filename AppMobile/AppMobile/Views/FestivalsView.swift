
import SwiftUI

struct FestivalsView: View {
    @EnvironmentObject var settings: BenevoleSettings
    
    @State var nomfestival:String=""
    @State var nbjour:Int=1
    
    @State var annee: String="2023"
    
    @State var result:String=""
    @ObservedObject var festivals : ListFestivalViewModel
    var festivalIntent : FestivalIntent
    /*@ObservedObject var festivals =
     ListFestivalViewModel(listfestival: [FestivalViewModel(festival: FestivalModel(_idfestival: 1, nomfestival: "Delta Festival", nbjours: 3, cloturer: false,annee: "")),
     FestivalViewModel(festival: FestivalModel(_idfestival: 2, nomfestival: "TGS", nbjours: 5, cloturer: true, annee: "")),
     FestivalViewModel(festival: FestivalModel(_idfestival: 3, nomfestival: "Eurockéenne", nbjours: 7, cloturer: true,annee: ""))])
     */
    init(viewModel:ListFestivalViewModel){
        festivals=viewModel
        festivalIntent=FestivalIntent(model: viewModel)
    }
    var body: some View {
        VStack{
            VStack{
                Text(result)
                TextField("Nom du festival",text :$nomfestival)
                    .padding()
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    ).padding(.bottom,30)
                TextField("Nombre de jours", value: $nbjour, formatter: NumberFormatter()).padding()
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    ).padding(.bottom,30)
                TextField("Année du festival",text :$annee)
                    .padding()
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    ).padding(.bottom,30)
                
            }
            
            Button("Créer un festival") {
                Task {
                    if(nomfestival==""){
                        result="Veuillez mettre un nom"
                    }
                    
                    else if(annee==""){
                        result="Veuillez mettre une annee"
                    }
                    
                    else{ await festivalIntent.createFestival(festival: FestivalModel(_idfestival: 0, nomfestival: nomfestival, nbjours: nbjour, cloturer: false, annee: "2023"))
                        result="reussi"}
                    
                    
                    
                }
            }
            
            
            
            VStack {
                
                ForEach(festivals.festivals, id: \.self) { festival in
                    HStack{
                        Text(festival.nomfestival)
                        NavigationLink(destination: FestivalView()){
                            Text("Détail")
                        }.simultaneousGesture(TapGesture().onEnded{
                            settings.nomFestival = festival.nomfestival
                            settings.dureeFestival = festival.nbjours
                            settings.anneeFestival = festival.annee
                        })
                    }
                    .padding(3)
                }
                
                
            }.task {
                await festivalIntent.getFestivals()
            }
            
            
            
            
            
            
        }
        .environmentObject(settings)
    }
        
    
    
    /*VStack{
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
     }
     }
     }
     }*/
    
}
        
   

struct FestivalsView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalsView(viewModel: ListFestivalViewModel(listfestival: []))
    }
}
