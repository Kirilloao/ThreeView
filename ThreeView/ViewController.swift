//
//  ViewController.swift
//  ThreeView
//
//  Created by Kirill Taraturin on 06.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let greenView = GreenView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        greenView.layer.cornerRadius = 10
        setViews()
        setupConstraints()
        changeViewColor()
        greenView.delegate = self
    }
    
    // MARK: - Private methods
    private func changeViewColor() {
        greenView.greenViewAction = { color in
            self.view.backgroundColor = color
        }
    }
    
    private func setViews() {
        view.backgroundColor = .systemGray2
        view.addSubview(greenView)
    }
    
    private func setupConstraints() {
        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 40
            ),
            greenView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -40
            ),
            greenView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 120
            ),
            greenView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -150
            )
        ])
    }
}

// MARK: - GreenViewDelegate
extension ViewController: GreenViewDelegate {
    func changeColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
