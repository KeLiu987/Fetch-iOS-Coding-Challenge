//
//  MealListView.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject var viewModel = MealListViewModel()
    @StateObject var detailViewModel = MealDetailViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.meals, id: \.idMeal) { meal in
                    NavigationLink {
                        detailView
                    } label: {
                        MealCell(meal: meal)
                            .onTapGesture {
                                detailViewModel.getMealDetails(mealId: meal.idMeal)
                            }
                    }
                }
                .navigationTitle("Meals")
            }
            .onAppear {
                viewModel.getMeals()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    var detailView: some View {
        VStack {
            Text(detailViewModel.mealDetails.first?.strMeal ?? "")
            Spacer()
            Text(detailViewModel.mealDetails.first?.strInstructions ?? "")
            Spacer()
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient1 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure1 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient2 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure2 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient3 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure3 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient4 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure4 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient5 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure5 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient6 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure6 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient7 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure7 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient8 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure8 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient9 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure9 ?? "")
            }
            HStack {
                Text(detailViewModel.mealDetails.first?.strIngredient10 ?? "")
                Text(detailViewModel.mealDetails.first?.strMeasure10 ?? "")
            }
        }
        .padding()
    }
}

#Preview {
    MealListView()
}
