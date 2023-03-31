import Foundation
import SwiftUI



struct BenevoleIntent {
    
    
    @ObservedObject private var model : ListBenevolesViewModel
    
    init(model: ListBenevolesViewModel){
        self.model = model
    }
    
    
    
    func getBenevoles() async {
        self.model.state = .loadingBenevoles
        
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/benevoles") else {
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
                debugPrint("je suis conne")
                debugPrint("\(sdata)")
                guard let decoded : [BenevoleModel] = await JSONHelper.decode(data: data) else{
                    debugPrint("mauvaise récup données")
                    return
                }
                
                debugPrint("donneees decodeess")
                debugPrint(decoded)
                model.state = .loadedBenevoles(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    func getBenevolebyid(id:Int) async{
        self.model.state = .loadingBenevoles
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/benevoles/\(id)") else {
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
                guard let decoded : [BenevoleModel] = await JSONHelper.decode(data: data) else{
                    debugPrint("mauvaise récup données")
                    return
                }
                
                debugPrint("donneees decodeess")
                debugPrint(decoded)
                model.state = .loadedBenevoles(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    func createBenevole(benevole: BenevoleModel) async->String {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/benevoles") else {
                print("bad URL")
                return("bad url")
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: benevole) else {
                print("pb encodage")
                return("pb encodage")
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            debugPrint(sdata)
            return(sdata)
        } catch {
            print("probleme de create")
        }
        return("pb de create")
    }
    func updateBenevole(id:Int,benevole: BenevoleModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/benevoles/\(id)") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: benevole) else {
                print(" pb encodage")
                return
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            debugPrint(request.httpMethod)
        } catch {
            debugPrint("probleme de update")
        }
    }
    
    func deleteBenevolebyid(id:Int) async {
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/benevoles/\(id)") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            print(request)
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
            debugPrint(sdata)
        } catch {
            debugPrint("probleme de delete")
        }
    }
    
    func signin(email: String,password:String) async->BenevoleModel {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/signin") else {
                print("bad URL")
                return BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: "")
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            let benevole=BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: email, admin: false, password: password)
            guard let encoded = await JSONHelper.encode(data: benevole) else {
                print(" pb encodage")
                return BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: "")
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let sdata = String(data: data, encoding: .utf8)!
            debugPrint(sdata)
            guard let decoded : [BenevoleModel] = await JSONHelper.decode(data: data) else{
                debugPrint("mauvaise récup données")
                return BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: "")
            }
            return decoded[0]
        } catch {
            print("probleme de signin")
        }
        return BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: "")
    }
    
    
}
