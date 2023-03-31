
import SwiftUI

struct BenevoleView: View {
    @EnvironmentObject var settings: BenevoleSettings
    var body: some View {
        ZStack {
            beige_fond
                .ignoresSafeArea()
            
            VStack{
                Text("Informations du Bénévole")
                    .font(.system(size: 25))
                    .padding()
                Divider()
                Spacer()
                Text("Nom : \(settings.name)")
                Text("Prénom : \(settings.prenom)")
                Text("Adresse e-mail : \(settings.email)")
                Spacer()
            }
        }
        .environmentObject(settings)
    }
}

struct BenevoleView_Previews: PreviewProvider {
    static var previews: some View {
        BenevoleView().environmentObject(BenevoleSettings())
    }
}
