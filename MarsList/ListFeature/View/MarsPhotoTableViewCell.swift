//
//  MarsPhotoTableViewCell.swift
//  MarsList
//
//  Created by Bodgar Espinosa Miranda on 09/01/24.
//

import UIKit

class MarsPhotoTableViewCell: UITableViewCell {

    var marsView: MarsView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        marsView = MarsView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(viewModel: MarsViewModel) {
        marsView.configure(viewModel)
    }
    
    private func setupUI() {
        contentView.addSubview(marsView)
        marsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            marsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            marsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            marsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            marsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
    }

}
