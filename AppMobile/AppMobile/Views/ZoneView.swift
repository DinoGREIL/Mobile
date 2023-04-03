
import SwiftUI

struct ZoneView: View {
    @EnvironmentObject var settings: BenevoleSettings

    var body: some View {
        ZStack {
            beige_fond
                .ignoresSafeArea()
            
            VStack{
                Text("Informations sur la zone")
                    .font(.system(size: 25))
                    .padding()
                Divider()
                Spacer()
                Text("Nom : \(settings.nomZone)")
                Text("Bénévoles nécessaires : \(settings.ZoneBenevoleNecessaire) bénévoles")
                Spacer()
            }
        }
        .environmentObject(settings)
    }
}

struct ZoneView_Previews: PreviewProvider {
    static var previews: some View {
        ZoneView().environmentObject(BenevoleSettings())
    }
}
