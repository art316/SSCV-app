//
//  SSCVServices.swift
//  SSCV
//
//  Created by dev ios on 9/1/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation

struct SSCVServices{

    private  var useMock = ProcessInfo().environment[EnvironmentKeys.mock] == EnvironmentKeys.mockTrueValue
    
    var  session : NetworkSession!
    
    init(withSession session: NetworkSession) {
        self.session = session
    }
    
     func loadCVFromUrlString(_ urlString: String, completion: @escaping (Result<TalentManifesto , SSCVServicesError?>) -> (Void)) {
        if useMock {
            self.getTalentManifestoFromFile(completion: completion)
            return
        }
        
        guard let url = URL.init(string: urlString) else {
            completion(.failure(.InvalidUrl))
            return
        }
        
        let urlSession = self.session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(.serverError))
            }
            if let  response = response as? HTTPURLResponse{
                print(response.statusCode)
            }
            if let data =  data{
                do{
                    let str = String(data: data, encoding: .utf8)!
                    let jsonData = str.data(using: .utf8)!
                    print(String(data: jsonData, encoding: .utf8)!)
                    let talentManifesto = try JSONDecoder().decode(TalentManifesto.self, from: jsonData)
                    completion(.success(talentManifesto))
                }catch{
                    completion(.failure(.jsonError))
                }
            }
        }
        urlSession.resume()
    }
    
    private  func getTalentManifestoFromFile(completion: @escaping (Result<TalentManifesto , SSCVServicesError?>) -> (Void)){
        guard let path =  Bundle.main.path(forResource: JSONFileNames.sscv, ofType: ".json"),
            let data = try?  Data.init(contentsOf: URL.init(fileURLWithPath: path)) else{
                completion(.failure(.jsonError))
            return
        }
        do{
           let talentManifesto = try JSONDecoder().decode(TalentManifesto.self, from: data)
            completion(.success(talentManifesto))
        }catch{
            completion(.failure(.jsonError))
        }
    }
}
