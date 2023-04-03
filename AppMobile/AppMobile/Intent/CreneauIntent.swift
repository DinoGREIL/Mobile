
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
            
            return
        }
        do{
          
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
               
                guard let decoded : [CreneauModel] = await JSONHelper.decode(data: data) else{
                    
                    return
                }
                
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
            
            return
        }
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
           
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                
                
                guard let decoded : [CreneauModel] = await JSONHelper.decode(data: data) else{
                    
                    return
                }
                
                
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
            let yourDate1=creneau.debut
            print(yourDate1)
            let yourDate2=creneau.fin
            let dateFormatter = DateFormatter()

             //specify the date Format
             dateFormatter.dateFormat="MM/dd/YYYY HH:mm:ss"

             //get date from string
             let dateString1 = dateFormatter.date(from: yourDate1)
            let dateString2 = dateFormatter.date(from: yourDate2)
            
            print("bug")
            print(dateString1)
             //get timestamp from Date
             let dateTimeStamp1  = dateString1!.timeIntervalSince1970
            let dateTimeStamp2  = dateString2!.timeIntervalSince1970
            guard let encoded = await JSONHelper.encode(data: creneau) else {
                print("pb encodage")
                return
            }
            
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            
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
            
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let sdata = String(data: data, encoding: .utf8)!
            
        } catch {
            debugPrint("probleme de delete")
        }
    }
}
