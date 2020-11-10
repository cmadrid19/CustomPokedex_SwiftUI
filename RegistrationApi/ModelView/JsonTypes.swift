//
//  JsonTypes.swift
//  RegistrationApi
//
//  Created by Maxim Macari on 09/11/2020.
//


import SwiftUI

class JsonTypes: ObservableObject {
    
    @Published var types = [Type]()
    
    
    init() {
        if let localData = self.readLocalFile(name: "types") {
            self.parse(jsonData: localData)
        }
    }
    
    private func readLocalFile(name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8){
                return jsonData
            }
        }catch{
            print(error)
        }
        
        return nil
    }
    
    
    private func parse(jsonData: Data){
        do{
            let decodedData = try JSONDecoder().decode([Type].self, from: jsonData)
            
            self.types = decodedData
        }catch{
            print("decode error")
        }
    }
    
//    private func loadJson(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
//        
//        if let url = URL(string: urlString){
//            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
//                if let error = error {
//                    completion(.failure(error))
//                }
//                
//                if let data = data {
//                    completion(.success(data))
//                }
//            }
//            
//            urlSession.resume()
//        }
//    }
    
}
