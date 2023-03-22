import Foundation
class ListFestivalModel : ObservableObject {
    
    private(set) var festivals = [FestivalModel]()
    
    init(festivals : [FestivalModel]){
        self.festivals = festivals
    }
}

