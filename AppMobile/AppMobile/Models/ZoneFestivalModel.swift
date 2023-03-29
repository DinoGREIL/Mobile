import Foundation
class ZoneFestivalModel:ObservableObject,Identifiable, Codable{
    var festival:Int
    var zone:Int
    


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(zone:Int,festival:Int){
        self.zone=zone
        self.festival=festival
        
        
    }
}
