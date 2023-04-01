

import Foundation
import SwiftUI



struct ZoneIntent {
    
    
    @ObservedObject private var model : ListZoneViewModel
    
    init(model: ListZoneViewModel){
        self.model = model
    }
    
   
    
    func getZones() async {
        self.model.state = .loadingZones
        
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zones") else {
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                 
                debugPrint("\(sdata)")
                guard let decoded : [ZoneModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
                model.state = .loadedZones(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    func getZonebyid(id:Int) async{
        self.model.state = .loadingZones
        guard let url = URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zones/\(id)") else {
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                 
                debugPrint("\(sdata)")
                guard let decoded : [ZoneModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
                model.state = .loadedZones(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    func createZone(zone: ZoneModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zones") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: zone) else {
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
    func updateBenevole(id:Int,zone: ZoneModel) async {
        
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zones/\(id)") else {
                print("bad URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            // append a value to a field
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // set (replace) a value to a field
            guard let encoded = await JSONHelper.encode(data: zone) else {
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
    
    func deleteBenevolebyid(id:Int) async{
        do {
            guard let url=URL(string: "https://apimobiledino.cluster-ig4.igpolytech.fr/zones/\(id)") else {
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
