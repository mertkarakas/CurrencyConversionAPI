//
//  ServiceManager.swift
//  
//
//  Created by Mert Karakas on 23.06.2022.
//

import Foundation

public protocol ServiceManagerProtocol {
    func call<T: Decodable>(request: Requestable, completion: @escaping(Result<T>) -> Void)
}

public final class ServiceManager: ServiceManagerProtocol {

    public init() {}

    public func call<T: Decodable>(request: Requestable, completion: @escaping(Result<T>) -> Void) {
        guard let urlRequest = APIRequest.createRequest(request) else {
            return
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data,
                  let responseModel = try? JSONDecoder().decode(T.self, from: data) else {
                let serviceError = ServiceError(data: data)
                APILogger.log(error: serviceError.serviceError, for: urlRequest.url?.absoluteString ?? "")
                completion(Result.failure(serviceError))
                return
            }

            APILogger.log(response: data, for: urlRequest.url?.absoluteString)

            completion(Result.success(responseModel))

        }.resume()
    }
}
