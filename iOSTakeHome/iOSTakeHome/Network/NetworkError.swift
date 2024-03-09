//
//  NetworkError.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
