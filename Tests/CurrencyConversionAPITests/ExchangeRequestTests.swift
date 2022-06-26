//
//  RequestModelTests.swift
//  
//
//  Created by Mert Karakas on 24.06.2022.
//

import XCTest
@testable import CurrencyConversionAPI

class RequestModelTests: XCTestCase {
    private var request: ExchangeRequest!

    override func setUp() {
        super.setUp()

        self.request = ExchangeRequest(fromAmount: "100.51", fromCurrency: .usd, toCurrency: .eur)
    }

    func testCreateRequestModel() {
        // Then
        XCTAssertEqual(request.path(), "/currency/commercial/exchange/100.51-USD/EUR/latest")
    }

    func testURLRequest() {
        // When
        let urlRequest = APIRequest.createRequest(request)

        // Then
        XCTAssertEqual(urlRequest?.url?.absoluteString, "http://api.evp.lt/currency/commercial/exchange/100.51-USD/EUR/latest?")
    }
}
