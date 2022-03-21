//
//  DougService.swift
//  CocoaPodsApp
//
//  Created by Sandra Monteiro de Castro on 21/03/22.
//

import UIKit
import Foundation

enum UserError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
}

protocol ServicesProtocol {
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void)
}

class DougService: ServicesProtocol {
    
    let session = URLSession.shared
    
    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    // Singleton pattern
    static var shared: DougService = {
        let instance = DougService()
        return instance
    }()
    
    // That function will be used to fetch data from Itunes
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void) {
        
        // verify if is a valid url
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid)) }
        
        // data check
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                
                let userResponse =  try decoder.decode([User].self, from: jsonData)
                
                completion(.success(userResponse))
                
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
    
}
