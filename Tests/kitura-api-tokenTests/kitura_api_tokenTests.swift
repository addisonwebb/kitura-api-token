import XCTest
@testable import kitura_api_token

class kitura_api_tokenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(kitura_api_token().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
