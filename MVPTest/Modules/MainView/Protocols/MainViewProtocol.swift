//
//  MainViewProtocol.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import Foundation

protocol MainViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func updateLabel(text: String)
}