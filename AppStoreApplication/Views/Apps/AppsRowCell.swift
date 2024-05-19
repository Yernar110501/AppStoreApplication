//
//  AppsRowCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 14.05.2024.
//

import UIKit
import SDWebImage


class AppsRowCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "AppsRowCell"
    
    private let imageView = UIImageView(cornerRadius: 8)
    private let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    private let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    private let getButton = UIButton(title: "Get")
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lyfecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        self.companyLabel.text = nil
        self.nameLabel.text = nil
        self.imageView.image = nil
    }
    // MARK: - Helpers
    private func configureViews() {
        let stackView = UIStackView(arrangedSubviews: [imageView,
                                                      VerticalStackView(arrangedSubviews: [nameLabel, companyLabel]),
                                                      getButton])
        addSubview(stackView)
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
    
    public func configure(with model: FeedResult) {
        self.companyLabel.text = model.artistName
        self.nameLabel.text = model.name
        self.imageView.sd_setImage(with: model.artworkUrl100)
    }
}
