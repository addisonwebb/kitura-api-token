import Foundation
import Kitura

public class APITokenVerification: RouterMiddleware {
    
    private let apiTokens: [String: UUID]
    
    public init(with tokens: [String: UUID]) {
        apiTokens = tokens
    }
    
    /// Verifies the request contains a valid apiToken.
    public func handle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        // get apiToken from request header
        if let apiToken = request.headers["apiToken"] {
            // verify apiToken is valid
            if let token = UUID(uuidString: apiToken) {
                let apiTokenIsValid = apiTokens.contains(where: { (key: String, value: UUID) -> Bool in
                    return value == token
                })
                
                if apiTokenIsValid || apiTokens.count < 1 {
                   next()
                } else {
                    try? response.send(status: .unauthorized).end()
                }
            } else {
                try? response.send(status: .badRequest).end()
            }
        } else {
            try? response.send(status: .badRequest).end()
        }
    }
}
