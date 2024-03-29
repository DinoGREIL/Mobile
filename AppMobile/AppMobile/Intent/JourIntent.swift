
import Foundation
import SwiftUI



struct JourIntent {
    
    
    @ObservedObject private var model : ListJourViewModel
    
    init(model: ListJourViewModel){
        self.model = model
    }
    
   
    
    func getJours() async {
        self.model.state = .loadingJours
        
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/jours") else {
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                 
                debugPrint("\(sdata)")
                guard let decoded : [JourModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
                model.state = .loadedJours(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    func getJourbyid(id:Int) async{
        self.model.state = .loadingJours
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/jours/\(id)") else {
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                 
                debugPrint("\(sdata)")
                guard let decoded : [JourModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
                model.state = .loadedJours(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    func createJour(jour: JourModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/jours") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: jour) else {
                 print("pb encodage")
                return
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            debugPrint(sdata)
        } catch {
            print("probleme de create")
        }
    }
    func updateJour(id:Int,jour: JourModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/jours/\(id)") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: jour) else {
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
    
    func deleteFestivalbyid(id:Int) async{
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/jour/\(id)") else {
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
