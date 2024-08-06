//
//  QuakeError.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 19/07/24.
//

import Foundation

enum QuakeError: Error,Equatable {
    case missingData
    case networkError
    case unexpectedError(error: Error)
    
    static func == (lhs: QuakeError, rhs: QuakeError) -> Bool {
            switch (lhs, rhs) {
            case (.missingData, .missingData):
                return true
            case (.networkError, .networkError):
                return true
            case (.unexpectedError(let lhsError), .unexpectedError(let rhsError)):
                return lhsError.localizedDescription == rhsError.localizedDescription
            default:
                return false
            }
        }
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Discarding a quake missing a valid code, magnitude, place, or time.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching quake data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}
