

import SwiftUI

struct FestivalView: View {

    var body: some View {
        VStack{
            NavigationView {
                NavigationLink(destination: FestivalsView(viewModel: ListFestivalViewModel(listfestival: []))) {
                    Text("Retour liste festival")
                }
            }

        }
    }
}


struct FestivalView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalView()
    }
}
