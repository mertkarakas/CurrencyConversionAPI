//
//  Result.swift
//  
//
//  Created by Mert Karakas on 24.06.2022.
//

// MARK: - Custom Result enum.

public enum Result<Value> {
    case success(Value)
    case failure(ServiceError)
}
