//
//  MealDetailViewModel.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import Foundation

final class MealDetailViewModel: ObservableObject {
    @Published var mealDetails: [MealDetail] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
        
    func getMealDetails(mealId: String) {
        isLoading = true
        
        NetworkManager.shared.getMealDetails(id: mealId) { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let mealDetails):
                    self.mealDetails = mealDetails
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
