//
//  ServiceErrorModelTests.swift
//  
//
//  Created by Mert Karakas on 24.06.2022.
//

import XCTest
@testable import CurrencyConversionAPI

final class ServiceErrorModelTests: XCTestCase {

    func testServiceErrorModel() {
        // Given
        let errorString = "error"
        let descriptionString = "description"
        let error = ServiceError(data: "{\"error\":\"\(errorString)\", \"error_description\":\"\(descriptionString)\"}".data(using: .utf8), url: nil)

        // Then
        XCTAssertEqual(error.serviceError.error, errorString)
        XCTAssertEqual(error.serviceError.error_description, descriptionString)
    }
}
