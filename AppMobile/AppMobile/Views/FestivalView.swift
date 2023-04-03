

import SwiftUI

struct FestivalView: View {
    @EnvironmentObject var settings: BenevoleSettings

    var body: some View {
        ZStack{
            beige_fond
                .ignoresSafeArea()
            
            VStack{
                Text("Informations du Festival")
                    .font(.system(size: 25))
                    .padding()
                Divider()
                Spacer()
                Text("Nom du festival : \(settings.nomFestival)")
                Text("Durée du festival : \(settings.dureeFestival) jours")
                Text("Année du festival : \(settings.anneeFestival)")
                Spacer()
            }

        }
        .environmentObject(settings)
    }
}


struct FestivalView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalView()
            .environmentObject(BenevoleSettings())
    }
}
