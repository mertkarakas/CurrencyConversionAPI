//
//  Logger.swift
//  
//
//  Created by Mert Karakas on 25.06.2022.
//

import Foundation

struct APILogger {

    static func log(error: ServiceErrorModel?, for uri: String) {
        let message = """

        ❌ \(uri) failed.
        💬 Message: \(error?.error ?? "")
        💬 Description: \(error?.error_description ?? "")

        """
        print(message)
    }

    static func log(response: Data, for uri: String?) {
        let status = "✅"
        print("\(status) \(uri ?? "") success")
        print("Response:\n \(String(data: response, encoding: .utf8) ?? "")")
    }
}
