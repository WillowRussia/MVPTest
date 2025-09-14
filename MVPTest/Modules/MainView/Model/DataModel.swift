//
//  DataModel.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import Foundation

struct DataModel {
    func fetchData(completion: @escaping (String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion("Все работает")
        }
    }
}
