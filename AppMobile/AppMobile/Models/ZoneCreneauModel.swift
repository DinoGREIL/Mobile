
class ZoneCreneauModel:ObservableObject,Identifiable, Codable{
    
    var zone:ZoneModel
    var creneau:CreneauModel


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(zone:ZoneModel,creneau:CreneauModel){
        self.zone=zone
        self.creneau = creneau
       
        
        
    }
}
