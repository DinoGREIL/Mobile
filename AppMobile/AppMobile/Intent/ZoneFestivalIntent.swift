

import Foundation
import SwiftUI
struct ZoneFestivalIntent {
    
    
    @ObservedObject private var model : ListZoneFestivalViewModel
    
    init(model: ListZoneFestivalViewModel){
        self.model = model
    }
    
   
    
    func getZoneFestivals() async {
        self.model.state = .loadingZoneFestival
        
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonefestival") else {
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                
                debugPrint("\(sdata)")
                guard let decoded : [ZoneFestivalModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
                model.state = .loadedZoneFestival(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    func getZoneFestivalbyidzone(id:Int) async{
        self.model.state = .loadingZoneFestival
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonefestivalzone/\(id)") else {
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                 
                debugPrint("\(sdata)")
                guard let decoded : [ZoneFestivalModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
                model.state = .loadedZoneFestival(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    func getZoneFestivalbyidfestival(id:Int) async{
        self.model.state = .loadingZoneFestival
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonefestivalfestival/\(id)") else {
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                 
                debugPrint("\(sdata)")
                guard let decoded : [ZoneFestivalModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
                model.state = .loadedZoneFestival(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }

    
    
    
    
    func createZoneFestival(zonefestival: ZoneFestivalModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonefestival") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: zonefestival) else {
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
    
    
    func deleteZoneFestivalbyid(id:Int) async{
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zonefestival/\(id)") else {
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
