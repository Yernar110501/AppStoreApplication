//
//  AppsRowCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 14.05.2024.
//

import UIKit



class AppsRowCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "AppsRowCell"
    
    let imageView = UIImageView(cornerRadius: 8 )
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "Get")
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configureViews() {
        let stackView = UIStackView(arrangedSubviews: [imageView,
                                                      VerticalStackView(arrangedSubviews: [nameLabel, companyLabel]),
                                                      getButton])
        addSubview(stackView)
        imageView.backgroundColor = .yellow
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = .init(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32/2
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.fillSuperview()
    }
}
