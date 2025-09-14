//
//  ProductDetailViewProtocol.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import Foundation

protocol ProductDetailViewProtocol: AnyObject {
    func showProduct(_ product: Product)
    func showLoading()
    func hideLoading()
}