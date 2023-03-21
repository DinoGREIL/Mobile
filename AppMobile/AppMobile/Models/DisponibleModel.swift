class DisponibleModel:ObservableObject,Identifiable, Codable{
    var benevole : BenevoleModel
    
    var creneau:CreneauModel


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(creneau:CreneauModel,benevole:BenevoleModel){
        
        self.creneau = creneau
        self.benevole = benevole
        
        
    }
}
