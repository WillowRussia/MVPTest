//
//  ProductListPresenter.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import Foundation

class ProductListPresenter {
    weak var view: ProductListViewProtocol?
    private let model = ProductModel()

    func viewDidLoad() {
        loadProducts()
    }

    private func loadProducts() {
        view?.showLoading()
        model.fetchProducts { [weak self] result in
            DispatchQueue.main.async {
                self?.view?.hideLoading()
                switch result {
                case .success(let products):
                    self?.view?.updateProducts(products)
                case .failure(let error):
                    self?.view?.showError(error.localizedDescription)
                }
            }
        }
    }

    func didSelectProduct(at index: Int) {
        view?.didSelectProduct(model.products[index])
    }
}
