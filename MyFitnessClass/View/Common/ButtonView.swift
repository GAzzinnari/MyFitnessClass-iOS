//
//  BottonView.swift
//  MyFitnessClass
//
//  Created by Gabriel on 7/31/20.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation
import UIKit

class ButtonView: UIView {
    var action: (() -> Void)?
    var button: UIButton
    
    override init(frame: CGRect) {
        button = UIButton(type: .custom)
        action = nil
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        button = UIButton(type: .custom)
        action = nil
        super.init(coder: coder)
        
        setupViews()
    }
    
    func setup(withTitle title: String, action: @escaping () -> Void) {
        self.button.setTitle(title, for: .normal)
        self.action = action
    }
    
    private func setupViews() {
        self.addSubview(button)
        // Constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(invokeAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
    
    @objc private func invokeAction() {
        self.action?()
    }
}
