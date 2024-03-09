//
//  LoadingView.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
