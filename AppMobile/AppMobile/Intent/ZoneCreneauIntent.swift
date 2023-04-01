
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
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                
                debugPrint("\(sdata)")
                guard let decoded : [ZoneCreneauModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
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
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                 
                debugPrint("\(sdata)")
                guard let decoded : [ZoneCreneauModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
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
             
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
             
             
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                 
                debugPrint("\(sdata)")
                guard let decoded : [ZoneCreneauModel] = await JSONHelper.decode(data: data) else{
                     
                    return
                }
                
                 
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
