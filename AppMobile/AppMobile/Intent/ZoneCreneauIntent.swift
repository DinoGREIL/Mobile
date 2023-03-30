
import Foundation
import SwiftUI
struct ZoneCreneauIntent {
    
    
    @ObservedObject private var model : ListZoneCreneauViewModel
    
    init(model: ListZoneCreneauViewModel){
        self.model = model
    }
    
   
    
    func getZoneCreneaux() async {
        self.model.state = .loadingZoneCreneau
        
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonecreneau") else {
            debugPrint("bad url getUser")
            return
        }
        do{
            /*var requete = URLRequest(url: url)
            requete.httpMethod = "GET"
            //append a value to a field
            requete.addValue("application/json", forHTTPHeaderField: "Content-Type")
             */
            //set (replace) a value to a field
            //requete.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
            /*
            guard let encoded = await JSONHelper.encode(data: self.user) else {
                print("pb encodage")
                return
            }
            let (data, response) = try await URLSession.shared.upload(for: requete, from: encoded)*/
            let (data, response) = try await URLSession.shared.data(from: url)
            debugPrint("data normal")
            debugPrint(data)
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
               // model.state = .loadedUsers([UserDTO(idUtilisateur: 11, nom: "truc", prenom: "mgd", email: "ege", mdp: "fefe", isAdmin: 1)])
                
                debugPrint("\(sdata)")
                guard let decoded : [ZoneCreneauModel] = await JSONHelper.decode(data: data) else{
                    debugPrint("mauvaise récup données")
                    return
                }
                
                debugPrint("donneees decodeess")
                debugPrint(decoded)
                model.state = .loadedZoneCreneau(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    func getZoneCreneaubyidzone(id:Int) async{
        self.model.state = .loadingZoneCreneau
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonecreneauzone/\(id)") else {
            debugPrint("bad url getUser")
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
            debugPrint("data normal")
            debugPrint(data)
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                debugPrint("je suis conne")
                debugPrint("\(sdata)")
                guard let decoded : [ZoneCreneauModel] = await JSONHelper.decode(data: data) else{
                    debugPrint("mauvaise récup données")
                    return
                }
                
                debugPrint("donneees decodeess")
                debugPrint(decoded)
                model.state = .loadedZoneCreneau(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    func getZoneCreneaubyidcreneau(id:Int) async{
        self.model.state = .loadingZoneCreneau
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonecreneaucreneau/\(id)") else {
            debugPrint("bad url getUser")
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
            debugPrint("data normal")
            debugPrint(data)
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                debugPrint("je suis conne")
                debugPrint("\(sdata)")
                guard let decoded : [ZoneCreneauModel] = await JSONHelper.decode(data: data) else{
                    debugPrint("mauvaise récup données")
                    return
                }
                
                debugPrint("donneees decodeess")
                debugPrint(decoded)
                model.state = .loadedZoneCreneau(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }

    
    
    
    
    func createZoneCreneau(zonecreneau: ZoneCreneauModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonecreneau") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: zonecreneau) else {
                print("GoRest: pb encodage")
                return
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            debugPrint(sdata)
        } catch {
            print("probleme de create")
        }
    }
    
    
    func deleteZoneCreneaubyid(id:Int) async{
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonecreneau/\(id)") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: id) else {
                print("pb encodage")
                return
            }
            debugPrint(encoded)
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            debugPrint(response)
        } catch {
            debugPrint("probleme de delete")
        }
    }
    
    
    
    
    
}
