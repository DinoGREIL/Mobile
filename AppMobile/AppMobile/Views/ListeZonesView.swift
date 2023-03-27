
import SwiftUI

struct ListZonesView: View {
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
            }
        }
    }
}

struct ListZonesView_Previews: PreviewProvider {
    static var previews: some View {
        ListZonesView()
    }
}
