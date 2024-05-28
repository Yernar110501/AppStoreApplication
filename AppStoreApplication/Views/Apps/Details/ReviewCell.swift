//
//  ReviewCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 28.05.2024.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "ReviewCell"
    private let titleLabel = UILabel(text: "ReviewTitle", font: .boldSystemFont(ofSize: 16))
    private let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    private let starsLabel = UILabel(text: "stars", font: .systemFont(ofSize: 14))
    private let bodyLabel = UILabel(text: "Review body ", font: .systemFont(ofSize: 16), numberOfLines: 0)
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.cornerRadius = 16
        let stackView = VerticalStackView(
            arrangedSubviews: [
                UIStackView(
                    arrangedSubviews: [titleLabel, authorLabel], customSpacing: 8
                ),
                starsLabel,
                bodyLabel],
            spacing: 12)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16,
                                               left: 16,
                                               bottom: 16,
                                               right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lyfecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.authorLabel.text = nil
        self.starsLabel.text = nil
        self.bodyLabel.text = nil
    }
    
    // MARK: - Helpers
    public func configure(with model: Entry) {
        self.authorLabel.text = model.author.name.label
        self.titleLabel.text = model.title.label
        self.bodyLabel.text = model.content.label
        self.starsLabel.text = model.rating.label
    }
    
}
