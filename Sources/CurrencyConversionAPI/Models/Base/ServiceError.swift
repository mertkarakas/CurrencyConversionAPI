//
//  ServiceError.swift
//  
//
//  Created by Mert Karakas on 23.06.2022.
//

import Foundation

public struct ServiceErrorModel: Decodable {
    public let error: String
    public let error_description: String
}

enum ErrorType: String {
    case general = "Something went wrong"
    case parser = "Parser error"
}

public final class ServiceError: Error {
    
    // MARK: - Properties

    public var serviceError: ServiceErrorModel

    // MARK: - Init

    init(data: Data?) {

        guard let data = data else {
            serviceError = ServiceErrorModel(error: "", error_description: ErrorType.general.rawValue)
            return
        }
        guard let serviceError = try? JSONDecoder().decode(ServiceErrorModel.self, from: data) else {
            serviceError = ServiceErrorModel(error: "", error_description: ErrorType.parser.rawValue)
            return
        }

        self.serviceError = serviceError
    }
}
