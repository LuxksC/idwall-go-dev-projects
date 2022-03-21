//
//  User.swift
//  AppNetworking
//
//  Created by Sandra Monteiro de Castro on 18/03/22.
//

import Foundation

//app.quicktype.io
struct User: Codable {
    /*Codable é um typealias equivalente a Encodable(estrutura a ser enviada como objeto pro servidor) e Decodable(quando precisamos pegar algo do servidor e transformar em um objeto para ser usado)*/
    let id: Int
    let name, usename, email: String
    let address: Address?
    let phone: String
    let company: Company
}

struct Address: Codable {
    let street, city, zipcode: String? //optional
}

struct Company: Codable {
    let name: String
}
