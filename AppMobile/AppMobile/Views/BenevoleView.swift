
import SwiftUI

struct BenevoleView: View {
    @EnvironmentObject var settings: BenevoleSettings
    var body: some View {
        VStack{
            Text("Info Bénévole")
            Text("\(settings.name)")
        }
        .environmentObject(settings)
    }
}

struct BenevoleView_Previews: PreviewProvider {
    static var previews: some View {
        BenevoleView().environmentObject(BenevoleSettings())
    }
}
