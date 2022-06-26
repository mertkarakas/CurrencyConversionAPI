//
//  Requestable.swift
//  
//
//  Created by Mert Karakas on 23.06.2022.
//

import Foundation

public enum RequestHTTPMethod: String {
    case get = "get"
    case post = "post"
}

public protocol Requestable: Encodable {
    func path() -> String
    func parameters() -> [String: Any]
    func headers() -> [String: String]
    func body() -> [String: Any?]
    func httpMethod() -> RequestHTTPMethod
}

// MARK: - Optional Requestable protocol properties

extension Requestable {
    public func path() -> String { "" }
    public func parameters() -> [String: Any] { [:] }
    public func headers() -> [String: String] { [:] }
    public func body() -> [String: Any?] { [:] }
    public func httpMethod() -> RequestHTTPMethod { .get }
}
