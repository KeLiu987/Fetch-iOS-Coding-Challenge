//
//  AlertItem.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
}

enum AlertContext {
    
    //MARK: - Network Errors
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("Cannot reach the server. Please try again later."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete the request. Please try again later."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid data from the server. Please try again later."),
                                            dismissButton: .default(Text("Ok")))
}
