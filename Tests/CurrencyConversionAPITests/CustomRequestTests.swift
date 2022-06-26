//
//  CustomRequestTests.swift
//  
//
//  Created by Mert Karakas on 24.06.2022.
//

import XCTest
@testable import CurrencyConversionAPI

final class CustomRequestTests: XCTestCase {

    private var request: MockRequest!

    override func setUp() {
        super.setUp()

        self.request = MockRequest()
    }

    func testRequestableFunctions() throws {
        // When
        let urlRequest = APIRequest.createRequest(request)

        // Then
        XCTAssertEqual(try XCTUnwrap(urlRequest?.httpMethod), "POST")
        XCTAssertEqual(try XCTUnwrap(urlRequest?.url?.absoluteString), "http://api.evp.lt/path?parameters=yes")

        // Given
        let bodyString = try String(data: XCTUnwrap(urlRequest?.httpBody), encoding: String.Encoding.utf8)

        //Then
        XCTAssertEqual(bodyString, "{\n  \"body\" : \"true\"\n}")
    }
}

fileprivate struct MockRequest: Requestable {

    func path() -> String {
        "/path"
    }

    func body() -> [String : Any?] {
        ["body": "true"]
    }

    func parameters() -> [String : Any] {
        ["parameters": "yes"]
    }

    func headers() -> [String : String] {
        ["auth":"salt"]
    }

    func httpMethod() -> RequestHTTPMethod {
        .post
    }
}
