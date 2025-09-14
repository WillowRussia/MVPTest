//
//  ProductListViewController.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import UIKit

class ProductListViewController: UIViewController {

    private let tableView = UITableView()
    private let presenter = ProductListPresenter()
    private var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Товары"
        presenter.view = self
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectProduct(at: indexPath.row)
    }
}

// MARK: - ProductListViewProtocol
extension ProductListViewController: ProductListViewProtocol {
    func showLoading() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Загрузка...",
            style: .plain,
            target: nil,
            action: nil
        )
    }

    func hideLoading() {
        navigationItem.rightBarButtonItem = nil
    }

    func updateProducts(_ products: [Product]) {
        self.products = products
        tableView.reloadData()
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func didSelectProduct(_ product: Product) {
        let detailVC = ProductDetailsViewController(product: product)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
