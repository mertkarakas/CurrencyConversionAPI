//
//  ExchangeService.swift
//  
//
//  Created by Mert Karakas on 23.06.2022.
//

import Foundation

public protocol ExchangeServiceProtocol {
    func exchange(request: Requestable, completion: @escaping(Result<ExchangeResponse>) -> Void)
}

public final class ExchangeService: BaseService, ExchangeServiceProtocol {
    
    public func exchange(request: Requestable, completion: @escaping (Result<ExchangeResponse>) -> Void) {
        call(request: request, completion: completion)
    }
}
