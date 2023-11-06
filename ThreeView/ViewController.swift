//
//  ViewController.swift
//  ThreeView
//
//  Created by Kirill Taraturin on 06.11.2023.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Private UI Properties
    private let firstView = MainView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
    
    private func setViews() {
        view.backgroundColor = .systemGray2
        view.addSubview(firstView)
    }
    
    private func setupConstraints() {
        firstView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            firstView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
}

