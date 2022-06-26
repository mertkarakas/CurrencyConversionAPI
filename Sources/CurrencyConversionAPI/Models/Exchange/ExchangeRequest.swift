//
//  ExchangeRequest.swift
//  
//
//  Created by Mert Karakas on 23.06.2022.
//

import Foundation

public struct ExchangeRequest: Requestable {

    private let fromAmount: String
    private let fromCurrency: String
    private let toCurrency: String

    public init(
        fromAmount: String,
        fromCurrency: String,
        toCurrency: String
    ) {
        self.fromAmount = fromAmount
        self.fromCurrency = fromCurrency
        self.toCurrency = toCurrency
    }

    public func path() -> String {
        ServiceConstants.exchangePath + "\(fromAmount)-\(fromCurrency)/\(toCurrency)" + ServiceConstants.latest
    }
}
