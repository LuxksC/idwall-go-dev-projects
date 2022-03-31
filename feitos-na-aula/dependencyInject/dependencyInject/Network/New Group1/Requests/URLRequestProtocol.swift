import Foundation

protocol URLRequestProtocol {
    
    ///The API base url
    var baseURL: String { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
}
