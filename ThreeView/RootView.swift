//
//  SecondView.swift
//  ThreeView
//
//  Created by Kirill Taraturin on 06.11.2023.
//

import UIKit

final class RootView: UIView {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
