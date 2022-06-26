//
//  BaseService.swift
//  
//
//  Created by Mert Karakas on 23.06.2022.
//

public class BaseService: ServiceManagerProtocol {
    var serviceManager: ServiceManager

    public init(manager: ServiceManager) {
        self.serviceManager = manager
    }

    public func call<T>(request: Requestable, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        serviceManager.call(request: request, completion: completion)
    }
}
