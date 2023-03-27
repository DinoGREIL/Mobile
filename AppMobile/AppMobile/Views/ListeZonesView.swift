
import SwiftUI

struct ListZonesView: View {
    @ObservedObject var zones = ListZoneViewModel(listzone:
            [ZoneViewModel(zone : ZoneModel(_idzone: "", nomzone: "Hall", nbbenevole: 3)), ZoneViewModel(zone: ZoneModel(_idzone: "", nomzone: "Salle A", nbbenevole: 4)),ZoneViewModel(zone : ZoneModel(_idzone: "", nomzone: "Salle B", nbbenevole: 4))])
    
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
            }
            
        }
    }
}

struct ListZonesView_Previews: PreviewProvider {
    static var previews: some View {
        ListZonesView()
    }
}
