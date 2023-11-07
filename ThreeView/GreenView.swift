//
//  FirstView.swift
//  ThreeView
//
//  Created by Kirill Taraturin on 06.11.2023.
//

import UIKit

protocol GreenViewDelegate {
    func changeColor(_ color: UIColor)
}

final class GreenView: UIView {
    
    // MARK: - Delegate Properties
    var delegate: GreenViewDelegate?
    
    // MARK: - Closures
    var greenViewAction: (() -> Void)?
    
    // MARK: - Private UI Properties
    private let yellowView = YellowView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setupConstraints()
        yellowView.layer.cornerRadius = 10
        yellowView.delegate = self
        buttonDidTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func buttonDidTapped() {
        yellowView.buttonAction = {
            self.greenViewAction?()
        }
    }
    
    private func setViews() {
        backgroundColor = .green
        addSubview(yellowView)
    }
    
    private func setupConstraints() {
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yellowView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: 30)
            ,
            yellowView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -30
            ),
            yellowView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 90
            ),
            yellowView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -90
            )
        ])
    }
}

// MARK: - YellowViewDelegate
extension GreenView: YellowViewDelegate {
    func changeColor(_ color: UIColor) {
        delegate?.changeColor(color)
    }
}
