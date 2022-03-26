//
//  Service.swift
//  AppNetworking
//
//  Created by Sandra Monteiro de Castro on 18/03/22.
//

import Foundation
import UIKit

enum UserError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
}

protocol ServicesProtocol {
    
    //@escaping especifica uma chamada que pode levar um tempo para ser respondida. Para que o código entenda que aquilo vai retornar uma resposta em algum momento
    func getUsers(completion: @escaping(Result<[User]/*Caso de sucesso*/, UserError>) -> Void)
}

class Service: ServicesProtocol {
    
    let session = URLSession.shared
    
    let url = "url da api"
    
    static var shared: Service = {
        let instance = Service()
        return instance
    }()
    
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void) {
        
        // verificação de url válida
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid)) }
        
        //verificação dos dados
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                
                //caso o try de erro vai pro erro do catch
                //abaixo estamos pegando a resposta da API e transformando em um objeto
                let userResponse =  try decoder.decode([User].self, from: jsonData)
                
                completion(.success(userResponse))
                
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
    
    
}
