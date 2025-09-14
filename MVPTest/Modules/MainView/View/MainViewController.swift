//
//  MainViewController.swift
//  MVPTest
//
//  Created by Илья Востров on 14.09.2025.
//


import UIKit

class MainViewController: UIViewController {

    private let label = UILabel()
    private let loadButton = UIButton(type: .system)

    private let presenter = MainPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        setupUI()
        setupConstraints()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        title = "MVP Demo"
        view.backgroundColor = .systemBackground

        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.text = "Загрузка..."

        loadButton.setTitle("Загрузить данные", for: .normal)
        loadButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)

        view.addSubview(label)
        view.addSubview(loadButton)
    }

    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        loadButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            loadButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            loadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func loadButtonTapped() {
        presenter.didTapLoadButton()
    }
}

extension MainViewController: MainViewProtocol {
    func showLoading() {
        label.text = "Загрузка..."
        loadButton.isEnabled = false
        loadButton.alpha = 0.6
    }

    func hideLoading() {
        loadButton.isEnabled = true
        loadButton.alpha = 1.0
    }

    func updateLabel(text: String) {
        label.text = text
    }
}
