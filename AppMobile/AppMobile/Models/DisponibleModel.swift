import Foundation
class DisponibleModel:ObservableObject,Identifiable, Codable{
    var benevole2 : BenevoleModel
    
    var creneau:CreneauModel

    var idbenevole : Int
    var nombenevole:String
var prenom:String
var email:String
    
    var admin: Bool
    var password:String
    var idcreneau : Int
    var debut:String
    var fin:String
    var jour:Int
/*
    var Observers:[TrackObserver]=[]
    func register(nouveau:TrackObserver){
        Observers.append(nouveau)
    }*/
    init(creneau:CreneauModel,benevole:BenevoleModel){
        
        
        self.idbenevole = benevole.idbenevole
        self.nombenevole = benevole.nombenevole
        self.prenom = benevole.prenom
        self.email = benevole.email
        
        self.admin = benevole.admin
        self.password = benevole.password
        self.idcreneau = creneau.idcreneau
        self.debut = creneau.debut
        self.fin = creneau.fin
        self.jour = creneau.jour
        
        self.creneau = CreneauModel(_idcreneau: self.idcreneau, debut: debut, fin: fin, jour: jour)
        self.benevole2 = BenevoleModel(_idbenevole: idbenevole, BenevoleNom: nombenevole, BenevolePrenom: prenom, BenevoleMail: email, admin: admin, password: password)
    }
}
