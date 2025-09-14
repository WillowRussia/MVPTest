//
//  MainPresenter.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import Foundation

class MainPresenter {
    weak var view: MainViewProtocol?
    private let model = DataModel()

    func viewDidLoad() {
        view?.updateLabel(text: "Нажми")
    }

    func didTapLoadButton() {
        view?.showLoading()
        model.fetchData { [weak self] result in
            self?.view?.hideLoading()
            self?.view?.updateLabel(text: result)
        }
    }
}
