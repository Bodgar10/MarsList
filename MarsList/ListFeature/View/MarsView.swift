//
//  MarsView.swift
//  MarsList
//
//  Created by Bodgar Espinosa Miranda on 09/01/24.
//

import UIKit

class MarsView: UIView {
    
    // MARK: Private UI Components
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageFavorite: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "notFavorite")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        imageFavorite.image = viewModel.isFavorite ? UIImage(named: "favorite") : UIImage(named: "notFavorite")
    }
    
    private func setupUI() {
        addSubview(nameLabel)
        addSubview(imageFavorite)
        
        NSLayoutConstraint.activate([
            imageFavorite.heightAnchor.constraint(equalToConstant: 30),
            imageFavorite.widthAnchor.constraint(equalToConstant: 30),
            
            imageFavorite.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageFavorite.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageFavorite.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: imageFavorite.leadingAnchor, constant: -16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}
