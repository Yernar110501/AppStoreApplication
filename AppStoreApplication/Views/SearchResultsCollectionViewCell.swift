//
//  SearchResultsCollectionViewCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 05.05.2024.
//

import UIKit

class SearchResultsCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "SearchResultsCollectionViewCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitle("GET", for: .normal)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    // MARK: - Helpers
    
}
