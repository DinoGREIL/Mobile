
import SwiftUI

struct ListZonesView: View {
    @ObservedObject var zones : ListZoneViewModel
    var zoneIntent : ZoneIntent
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
                    List{
                    
                    }
                }
                
                Button("Ajouter Zone", action:{
                    
                })
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
                debugPrint("chargement data ?")
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
