//
//  MarsView.swift
//  MarsList
//
//  Created by Bodgar Espinosa Miranda on 09/01/24.
//

import UIKit

/// MarsViewModel with the name of the text that we need to show in this View.
struct MarsViewModel {
    /// Name of the text that we need into the view.
    var name: String
}

class MarsView: UIView {
    
    // MARK: Private UI Components
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: Public initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Private functions
    
    public func configure(_ viewModel: MarsViewModel) {
        nameLabel.text = viewModel.name
    }
    
    private func setupUI() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
        ])
    }
}
