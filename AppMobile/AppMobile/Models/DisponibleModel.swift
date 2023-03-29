import Foundation
class DisponibleModel:ObservableObject,Identifiable, Codable{
    var idbenevole : Int
    
    var idcreneau:Int

    
/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(creneau:Int,benevole:Int){
        
        
        self.idbenevole = benevole
        
        self.idcreneau = creneau
       
        
        
    }
}
