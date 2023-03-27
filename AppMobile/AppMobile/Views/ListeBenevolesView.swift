
import SwiftUI

struct ListeBenevolesView: View {
    var body: some View {
        ZStack {
            beige_fond
                .ignoresSafeArea()
            
            // Your other content here
            // Other layers will respect the safe area edges
            VStack{
                Text("Gestion des Bénévoles")
                Divider()
                Spacer()
            }
            
        }
    }
}

struct ListeBenevolesView_Previews: PreviewProvider {
    static var previews: some View {
        ListeBenevolesView()
    }
}
