//
//  ProductListViewProtocol.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import Foundation

protocol ProductListViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func updateProducts(_ products: [Product])
    func showError(_ message: String)
    func didSelectProduct(_ product: Product)
}