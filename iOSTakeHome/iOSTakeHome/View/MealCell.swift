//
//  MealCell.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import SwiftUI

struct MealCell: View {
    
    let meal: Meal
    
    var body: some View {
        HStack {
            MealImage(urlString: meal.strMealThumb)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)

            VStack(alignment: .leading, spacing: 5) {
                Text(meal.strMeal)
                    .font(.title2)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    MealCell(meal: MockData.sampleMeal)
}
