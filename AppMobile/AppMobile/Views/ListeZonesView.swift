
import SwiftUI

struct ListZonesView: View {
    @ObservedObject var zones : ListZoneViewModel
    var zoneIntent : ZoneIntent
    @State var nomzone:String=""
    @State var nbbenevole:Int=1
    init(viewModel : ListZoneViewModel){
        self.zones = viewModel
        self.zoneIntent = ZoneIntent(model: viewModel)
    }
    var body: some View {
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
                    Text(verbatim: "\(zones.count())")
                    
                }
                Spacer()
                VStack {
                    List{
                        ForEach(zones.zones, id: \.self) { zone in
                            NavigationLink(value: zone){
                                Text(zone.nomzone)
                                
                            }
                        }
                    }
                }
            .task {
                
                    await zoneIntent.getZones()
                    
            }
            }
            
        }
    }
}

struct ListZonesView_Previews: PreviewProvider {
    static var previews: some View {
        ListZonesView(viewModel: ListZoneViewModel(listzone: []))
    }
}
