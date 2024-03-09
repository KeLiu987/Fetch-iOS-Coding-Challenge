//
//  ImageDownload.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct ImagePlaceHolder: View {
    
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("placeHolderImage").resizable()
    }
}

struct MealImage: View {
    
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        ImagePlaceHolder(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURL: urlString) }
    }
}

