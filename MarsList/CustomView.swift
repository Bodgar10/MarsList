//
//  CustomView.swift
//  MarsList
//
//  Created by Bodgar Espinosa Miranda on 09/01/24.
//

import UIKit

class CustomView: UIView {
    
    struct CustomViewModel {
        let title: String
        let subtitle: String
    }
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var viewModel: CustomViewModel?
    
    convenience init(viewModel: CustomViewModel?) {
        self.init()
        self.viewModel = viewModel
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    private func configure() {
        titleLabel.text = viewModel?.title
        subtitleLabel.text = viewModel?.subtitle
    }
    
    private func setupUI() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
        ])
    }
}
