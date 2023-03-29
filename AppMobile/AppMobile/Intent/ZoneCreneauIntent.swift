
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
    }}
