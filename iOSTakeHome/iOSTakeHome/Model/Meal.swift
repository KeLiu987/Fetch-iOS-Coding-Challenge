//
//  Meal.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import Foundation

struct Meal: Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

struct MealResponse: Decodable {
    let meals: [Meal]
}

struct MockData {
    
    static let meals = [sampleMeal, sampleMeal, sampleMeal]
    static let sampleMeal = Meal(idMeal:"53049",
                                 strMeal: "Apam balik",
                                 strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
}
