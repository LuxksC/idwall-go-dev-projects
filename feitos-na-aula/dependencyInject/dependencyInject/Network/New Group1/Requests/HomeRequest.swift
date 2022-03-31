import Foundation

enum HomeRequest: URLRequestProtocol { //protocolo é usado para forçar a implementação de cada parte dele
    
    case home
    case details
    
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        
        /*
         timestamp
         
         MD5 = timestamp + publicKey + privateKey
         Uso de classe do stackoverflow pra criar o MD5
         */
        let timestamp = NSDate.timeIntervalSince1970.description
        
        switch self {
        case .home:
            return "limit=30&ts=\(timestamp)&apikey=\(Environment.publicKey)&hash=\(hashMD5(timestamp: ))"
        case .details:
            return "details =03821470"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .home:
            return .get
        case .details:
            return .post
        }
    }
    
    
    
    
}
