//
//  ProductDetailsViewController.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import UIKit

class ProductDetailsViewController: UIViewController {

    private let titleLabel = UILabel()
    private let descLabel = UILabel()
    private let presenter: ProductDetailPresenter

    init(product: Product) {
        self.presenter = ProductDetailPresenter(product: product)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Детали"
        presenter.view = self
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        [titleLabel, descLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
            view.addSubview($0)
        }

        titleLabel.font = .boldSystemFont(ofSize: 20)
        descLabel.font = .systemFont(ofSize: 16)
        descLabel.textColor = .secondaryLabel

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - ProductDetailViewProtocol
extension ProductDetailsViewController: ProductDetailViewProtocol {
    func showProduct(_ product: Product) {
        titleLabel.text = product.name
        descLabel.text = product.description
    }

    func showLoading() {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.startAnimating()
        navigationItem.titleView = indicator
    }

    func hideLoading() {
        navigationItem.titleView = nil
    }
}