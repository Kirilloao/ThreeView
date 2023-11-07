//
//  SecondView.swift
//  ThreeView
//
//  Created by Kirill Taraturin on 06.11.2023.
//

import UIKit

protocol YellowViewDelegate: AnyObject {
    func changeColor(_ color: UIColor)
}

final class YellowView: UIView {
    
    // MARK: - Delegate Properties
    var delegate: YellowViewDelegate?
    
    // MARK: - Closure
    var buttonAction: ((UIColor) -> Void)?
    
    // MARK: - Private UI Properties
    private lazy var mainStackView: UIStackView = {
        var mainSV = UIStackView()
        mainSV.axis = .vertical
        mainSV.spacing = 15
        mainSV.distribution = .fillEqually
        mainSV.addArrangedSubview(delegateButton)
        mainSV.addArrangedSubview(closureButton)
        return mainSV
    }()
    
    private lazy var delegateButton: UIButton = {
        var button = createButton(with: "Delegate button")
        button.addTarget(
            self,
            action: #selector(buttonDidTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var closureButton: UIButton = {
        var button = createButton(with: "Closure button")
        button.addTarget(
            self,
            action: #selector(buttonDidTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    @objc private func buttonDidTapped(_ sender: UIButton) {
        sender == closureButton ? buttonAction?(.red) : delegate?.changeColor(.orange)
    }
    
    // MARK: - Private Methods
    private func setViews() {
        backgroundColor = .yellow
        addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            mainStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

// MARK: - Create UI Methods
extension YellowView {
    private func createButton(with title: String) -> UIButton {
        let customButton = UIButton(type: .system)
        customButton.setTitle(title, for: .normal)
        customButton.backgroundColor = .darkGray
        customButton.layer.cornerRadius = 10
        customButton.tintColor = .white
        return customButton
    }
}
