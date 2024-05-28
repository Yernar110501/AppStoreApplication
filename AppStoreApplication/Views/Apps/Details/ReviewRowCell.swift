//
//  ReviewCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 28.05.2024.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "ReviewCell"
    private let reviewLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 24))
    let horizontalController = ReviewsController()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(reviewLabel, horizontalController.view)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Helpers
    
    private func configureConstraints() {
        reviewLabel.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: nil,
                           trailing: trailingAnchor,
                           padding: .init(top: 10,
                                          left: 16,
                                          bottom: 0,
                                          right: 16))
        horizontalController.view.anchor(top: reviewLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor,
                                         padding: .init(top: 10,
                                                        left: 0,
                                                        bottom: 16,
                                                        right: 0))
    }
}
