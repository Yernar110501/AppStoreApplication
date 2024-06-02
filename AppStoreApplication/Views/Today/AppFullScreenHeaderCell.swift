//
//  AppFullScreenHeaderCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 02.06.2024.
//

import UIKit

class AppFullScreenHeaderCell: UITableViewCell {
    let todayCell = TodayCell()
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.imageView?.fillSuperview()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(todayCell)
        todayCell.fillSuperview()
        addSubview(closeButton)
        
        closeButton.anchor(top: topAnchor,
                           leading: nil,
                           bottom: nil,
                           trailing: trailingAnchor,
                           padding: .init(top: 12, left: 0, bottom: 0, right: 12),
                           size: .init(width: 40, height: 40))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
