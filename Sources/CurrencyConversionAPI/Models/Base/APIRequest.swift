//
//  File.swift
//  
//
//  Created by Mert Karakas on 24.06.2022.
//

import Foundation

// MARK: - Build URLRequest with URLComponents

struct APIRequest {

    static func createRequest(_ requestable: Requestable) -> URLRequest? {
        var components = URLComponents()
        var queryItems: [URLQueryItem] = []

        let otherParams: [URLQueryItem] = requestable.parameters().map({
            return URLQueryItem(name: $0.key, value: $0.value as? String)
        })
        queryItems.append(contentsOf: otherParams)

        components.scheme = ServiceConstants.scheme
        components.host = ServiceConstants.baseURL
        components.path = requestable.path()
        components.queryItems = queryItems

        guard let url = components.url else {
            return nil
        }
        var request = URLRequest(url: url)

        let method = requestable.httpMethod()

        request.httpMethod = method.rawValue

        for header in requestable.headers() {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }

        if !requestable.body().isEmpty {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestable.body(), options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }

        return request
    }
}
