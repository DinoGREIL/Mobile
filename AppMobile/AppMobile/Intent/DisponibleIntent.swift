

import Foundation
import SwiftUI



struct DisponibleIntent {
    
    
    @ObservedObject private var model : ListDisponibleViewModel
    
    init(model: ListDisponibleViewModel){
        self.model = model
    }
    
   
    
    func getDisponibles() async {
        self.model.state = .loadingDisponibles
        
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/disponible") else {
            
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
               
                
                
                guard let decoded : [DisponibleModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                model.state = .loadedDisponibles(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    func getDisponiblebyidbenevole(id:Int) async{
        self.model.state = .loadingDisponibles
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/disponiblebenevole/\(id)") else {
          
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                
                guard let decoded : [DisponibleModel] = await JSONHelper.decode(data: data) else{
                    
                    return
                }
                
                
                model.state = .loadedDisponibles(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    
    func getDisponiblebyidcreneau(id:Int) async{
        self.model.state = .loadingDisponibles
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/disponiblecreneau/\(id)") else {
            
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
               
                guard let decoded : [DisponibleModel] = await JSONHelper.decode(data: data) else{
                    
                    return
                }
                
                
                model.state = .loadedDisponibles(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }

    
    
    
    
    func createDisponible(disponible: DisponibleModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/disponible") else {
                
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: disponible) else {
                print("pb encodage")
                return
            }
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            
        } catch {
            print("probleme de create")
        }
    }
    
    
    func deleteDisponiblebyid(id:Int) async{
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/disponible/\(id)") else {
               
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
            
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            
        } catch {
            debugPrint("probleme de delete")
        }
    }
    
    
}
