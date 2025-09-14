//
//  ProductDetailPresenter.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import Foundation

class ProductDetailPresenter {
    weak var view: ProductDetailViewProtocol?
    private let product: Product

    init(product: Product) {
        self.product = product
    }

    func viewDidLoad() {
        view?.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view?.hideLoading()
            self.view?.showProduct(self.product)
        }
    }
}