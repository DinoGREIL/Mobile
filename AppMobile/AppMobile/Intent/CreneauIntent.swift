
import Foundation
import SwiftUI



struct CreneauIntent {
    
    
    @ObservedObject private var model : ListCreneauViewModel
    
    init(model: ListCreneauViewModel){
        self.model = model
    }
    
   
    
    func getCreneaux() async {
        self.model.state = .loadingCreneaux
        
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/creneaux") else {
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
               // model.state = .loadedUsers([UserDTO(idUtilisateur: 11, nom: "truc", prenom: "mgd", email: "ege", mdp: "fefe", isAdmin: 1)])
                
                debugPrint("\(sdata)")
                guard let decoded : [CreneauModel] = await JSONHelper.decode(data: data) else{
                    debugPrint("mauvaise récup données")
                    return
                }
                
                debugPrint("donneees decodeess")
                debugPrint(decoded)
                model.state = .loadedCreneaux(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    func getCreneaubyid(id:Int) async{
        self.model.state = .loadingCreneaux
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/creneaux/\(id)") else {
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
                guard let decoded : [CreneauModel] = await JSONHelper.decode(data: data) else{
                    debugPrint("mauvaise récup données")
                    return
                }
                
                debugPrint("donneees decodeess")
                debugPrint(decoded)
                model.state = .loadedCreneaux(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    func createCreneau(creneau: CreneauModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/creneaux") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            let yourDate=creneau.debut
            let dateFormatter = DateFormatter()

             //specify the date Format
             dateFormatter.dateFormat="yyyy-MM-dd"

             //get date from string
             let dateString = dateFormatter.date(from: yourDate)
            

             //get timestamp from Date
             let dateTimeStamp  = dateString!.timeIntervalSince1970
            debugPrint(dateTimeStamp)
            guard let encoded = await JSONHelper.encode(data: creneau) else {
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
    
    
    func deleteCreneaubyid(id:Int) async{
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/creneau/\(id)") else {
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
