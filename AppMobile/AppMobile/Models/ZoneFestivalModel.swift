import Foundation
class ZoneFestivalModel:ObservableObject,Identifiable, Codable{
    var festival:FestivalModel
    var zone:ZoneModel
    


/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(zone:ZoneModel,festival:FestivalModel){
        self.zone=zone
        self.festival=FestivalModel
        
        
    }
}
