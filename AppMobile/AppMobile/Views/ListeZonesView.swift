
import SwiftUI

struct ListZonesView: View {
    @EnvironmentObject var settings: BenevoleSettings

    @ObservedObject var zones : ListZoneViewModel
    var zoneIntent : ZoneIntent
    @State var nomzone:String=""
    @State var nbbenevole:Int=1
    init(viewModel : ListZoneViewModel){
        self.zones = viewModel
        self.zoneIntent = ZoneIntent(model: viewModel)
    }
    var body: some View {
        NavigationStack{
            ZStack {
                beige_fond
                    .ignoresSafeArea()
                
                // Your other content here
                // Other layers will respect the safe area edges
                VStack{
                    Text("Gestion des Zones")
                    Divider()
                    Spacer()
                    VStack{
                        TextField("Nom de la zone",text :$nomzone)
                            .padding()
                            .cornerRadius(5.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.blue, lineWidth: 1)
                            ).padding(.bottom,30)
                        
                        
                        TextField("Nombre de bénévoles nécessaires", value: $nbbenevole, formatter: NumberFormatter()).padding()
                            .cornerRadius(5.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.blue, lineWidth: 1)
                            ).padding(.bottom,30)
                        
                    }
                    
                    Button("Ajouter Zone"){Task {
                        await zoneIntent.createZone(zone: ZoneModel(_idzone: 0, nomzone: nomzone, nbbenevole: nbbenevole))}
                        
                        
                        
                    }
                    .padding()
                    .background(vert_nav)
                    .cornerRadius(20)
                    Spacer()
                    VStack{
                        Text(verbatim: "Nombre de zones : \(zones.count()) zones")
                    }
                    Spacer()
                    VStack {
                        
                        ForEach(zones.zones, id: \.self) { zone in
                            HStack{
                                Text(zone.nomzone)
                                NavigationLink(destination: ZoneView()){
                                    Text("Détail")
                                }.simultaneousGesture(TapGesture().onEnded{
                                    settings.nomZone = zone.nomzone
                                    settings.ZoneBenevoleNecessaire = zone.nbbenevole
                                })
                            }
                        }
                        
                    }
                    .task {
                        
                        await zoneIntent.getZones()
                        
                    }
                }
                
            }
        }
        .environmentObject(settings)
    }
}

struct ListZonesView_Previews: PreviewProvider {
    static var previews: some View {
        ListZonesView(viewModel: ListZoneViewModel(listzone: [])).environmentObject(BenevoleSettings())
    }
}
