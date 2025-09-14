//
//  Product.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import Foundation

struct Product {
    let id: Int
    let name: String
    let description: String
}

class ProductModel {
    let products = [
        Product(id: 1, name: "iPhone", description: "Смартфон"),
        Product(id: 2, name: "MacBook", description: "Ноутбук"),
        Product(id: 3, name: "AirPods", description: "Наушники")
    ]
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            completion(.success(self.products))
        }
    }
}
