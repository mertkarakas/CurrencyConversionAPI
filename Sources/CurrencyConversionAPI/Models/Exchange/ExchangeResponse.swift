//
//  ExchangeResponse.swift
//  
//
//  Created by Mert Karakas on 23.06.2022.
//

import Foundation

public struct ExchangeResponse: Decodable {
    public let amount: String
    public let currency: String
}
