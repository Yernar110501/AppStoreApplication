//
//  AppsPageHeader.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 18.05.2024.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    // MARK: - Properties
    static let identifier = "AppsPageHeader"
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        appHeaderHorizontalController.view.backgroundColor = .purple
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
