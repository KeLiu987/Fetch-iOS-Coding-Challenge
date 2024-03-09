//
//  MealListViewModel.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import Foundation

final class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getMeals() {
        isLoading = true
        
        NetworkManager.shared.getMeals { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let meals):
                    self.meals = meals
                    
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
