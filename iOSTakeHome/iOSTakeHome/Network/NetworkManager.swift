//
//  NetworkManager.swift
//  iOSTakeHome
//
//  Created by Ke Liu on 3/8/24.
//

import Foundation
import UIKit

class NetworkManager: NSObject {

    static let shared = NetworkManager()
    static let mealURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    private let cache = NSCache<NSString, UIImage>()
    
    private override init() {}
    
    func getMeals(completed: @escaping (Result<[Meal], NetworkError>) -> Void) {
        guard let url = URL(string: NetworkManager.mealURL) else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MealResponse.self, from: data)
                completed(.success(decodedResponse.meals))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getMealDetails(id: String, completed: @escaping (Result<[MealDetail], NetworkError>) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MealDetailResponse.self, from: data)
                completed(.success(decodedResponse.meals))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
