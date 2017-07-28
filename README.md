# KituraApiToken

KituraApiToken is API token validation middleware for [Kitura](https://github.com/IBM-Swift/Kitura).

KituraApiToken allows you to specify API tokens that different clients can use and verify those API tokens are used when calling endpoints. If an endpoint requires an API token and receives an incorrect token or does not receive one at all, a 401 unauthorized response is returned.

### Setup

In Package.swift, add KituraApiToken as a dependency for your project.
``` Swift
import PackageDescription

let package = Package(
    name: "example-app-name",
    dependencies: [
        .Package(url: "https://github.com/addisonwebb/kitura-api-token", majorVersion: 0)
    ]
)
```

### Example
Setup the `APITokenVerification` class with the API tokens you would like to accept.
``` Swift
public class RouterCreator {
    public static func create() -> Router {
        let router = Router()

        // api tokens
        let apiTokens = ["com.example-app.ios": UUID(uuidString: "A1F06875-E45D-4EEF-BB4F-05B95A572A81")!]
        router.all(middleware: APITokenVerification(with: apiTokens))

        return router
    }
}
```

Add the `apiToken` header to the appropriate HTTP requests.
``` sh
curl "http://example.com/foo" \
     -H "apiToken: B2D06875-E45D-4EEF-BB4F-05B95A572A82"
```



## License
Licensed under the MIT license. Full text available in [LICENSE](LICENSE.txt).
