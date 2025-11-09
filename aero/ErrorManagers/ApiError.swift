//
//  ApiError.swift
//  taillog
//
//  Created by Shubham Tiwari on 21/08/24.
//

import Foundation

enum ApiError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloadTooLarge
    case uriTooLong
    case unsupportedMediaType
    case rangeNotSatisfiable
    case expectationFailed
    case upgradeRequired
    case internalServerError
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case httpVersionNotSupported
    case unknownStatusCode(Int)
    case noInternet
    case couldNotReachServer
    case requestCancelled
    case networkError(String) // Generic network error with description

    init(statusCode: Int) {
        switch statusCode {
        case 400: self = .badRequest
        case 401: self = .unauthorized
        case 403: self = .forbidden
        case 404: self = .notFound
        case 405: self = .methodNotAllowed
        case 406: self = .notAcceptable
        case 408: self = .requestTimeout
        case 409: self = .conflict
        case 410: self = .gone
        case 411: self = .lengthRequired
        case 412: self = .preconditionFailed
        case 413: self = .payloadTooLarge
        case 414: self = .uriTooLong
        case 415: self = .unsupportedMediaType
        case 416: self = .rangeNotSatisfiable
        case 417: self = .expectationFailed
        case 426: self = .upgradeRequired
        case 500: self = .internalServerError
        case 501: self = .notImplemented
        case 502: self = .badGateway
        case 503: self = .serviceUnavailable
        case 504: self = .gatewayTimeout
        case 505: self = .httpVersionNotSupported
        default: self = .unknownStatusCode(statusCode)
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badRequest: return "Please enter valid data."
        case .unauthorized: return "Login Required"
        case .forbidden: return "You don’t have permission to access this."
        case .notFound: return "The requested resource could not be found."
        case .methodNotAllowed: return "Invalid HTTP request."
        case .notAcceptable: return "Requested format not available."
        case .requestTimeout: return "Request timed out. Please try again."
        case .conflict: return "There is conflict with the current state."
        case .gone: return "Data not available"
        case .lengthRequired: return "Content length required in header."
        case .preconditionFailed: return "Preconditions in request header failed."
        case .payloadTooLarge: return "Request is too large to process."
        case .uriTooLong: return "URI is too long."
        case .unsupportedMediaType: return "Media type not supported."
        case .rangeNotSatisfiable: return "Cannot supply the requested portion of the file."
        case .expectationFailed: return "Expect request-header field requirements not met."
        case .upgradeRequired: return "Client should switch to a different protocol."
        case .internalServerError: return "Something went wrong. Please try again later"
        case .notImplemented: return "Feature not supported. Contact support if needed."
        case .badGateway: return "Server error. Please try again later."
        case .serviceUnavailable: return "Server overloaded. Please try again later."
        case .gatewayTimeout: return "Server timeout. Please try again later."
        case .httpVersionNotSupported: return "HTTP protocol version not supported."
        case .unknownStatusCode(let code): return "Unknown error with status code \(code)."
        case .noInternet: return "No internet connection."
        case .couldNotReachServer: return "Could not reach the server."
        case .requestCancelled: return "The request was cancelled."
        case .networkError(let description): return "Network error: \(description)"
        }
    }
}


