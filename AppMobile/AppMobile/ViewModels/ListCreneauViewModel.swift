


class ListCreneauViewModel: ObservableObject {
    
    @Published var model : ListCreneauModel
    
    init(listcreneau: ListCreneauModel){
        self.model = listcreneau
    }
        
    
}
