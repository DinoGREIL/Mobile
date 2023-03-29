import Foundation
class ZoneCreneauModel:ObservableObject,Identifiable, Codable{
    
    var zone:Int
    var creneau:Int


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(zone:Int,creneau:Int){
        self.zone=zone
        self.creneau = creneau
       
        
        
    }
}
