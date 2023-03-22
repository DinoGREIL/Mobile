import Foundation
class ListBenevoleModel : ObservableObject {
    
    private(set) var benevoles = [BenevoleModel]()
    
    init(benevoles : [BenevoleModel]){
        self.benevoles = benevoles
    }
}
