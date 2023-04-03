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
            
            return
        }
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                guard let decoded : [BenevoleModel] = await JSONHelper.decode(data: data) else{
                    
                    return
                }
                
                
                model.state = .loadedBenevoles(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("Bad Request")
        }
    }
    func getBenevolebyid(id:Int) async{
        self.model.state = .loadingBenevoles
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/benevoles/\(id)") else {
            
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                
                guard let decoded : [BenevoleModel] = await JSONHelper.decode(data: data) else{
                    
                    return
                }
                
                
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
                
                return("bad url")
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            guard let encoded = await JSONHelper.encode(data: benevole) else {
                
                return("pb encodage")
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            
            return(sdata)
        } catch {
            print("probleme de create")
        }
        return("pb de create")
    }
    func updateBenevole(id:Int,benevole: BenevoleModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/benevoles/\(id)") else {
                
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
            guard let encoded = await JSONHelper.encode(data: benevole) else {
                
                return
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            
        } catch {
            debugPrint("probleme de update")
        }
    }
    
    func deleteBenevolebyid(id:Int) async {
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/benevoles/\(id)") else {
                
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: id) else {
                
                return
            }
            
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            
        } catch {
            debugPrint("probleme de delete")
        }
    }
    
    func signin(email: String,password:String) async->BenevoleModel {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/signin") else {
                
                return BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: "")
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let benevole=BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: email, admin: false, password: password)
            guard let encoded = await JSONHelper.encode(data: benevole) else {
                
                return BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: "")
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let sdata = String(data: data, encoding: .utf8)!
            
            guard let decoded : [BenevoleModel] = await JSONHelper.decode(data: data) else{
                
                return BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: "")
            }
            return decoded[0]
        } catch {
            print("probleme de signin")
        }
        return BenevoleModel(_idbenevole: 0, BenevoleNom: "", BenevolePrenom: "", BenevoleMail: "", admin: false, password: "")
    }
    
    
}
