//
//  FirstView.swift
//  ThreeView
//
//  Created by Kirill Taraturin on 06.11.2023.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - Private UI Properties
    private let rootView = RootView()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private MEthods
    private func setViews() {
        addSubview(rootView)
    }
    
    private func setupConstraints() {
        
    }
    
}
