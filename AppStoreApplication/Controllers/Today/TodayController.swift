//
//  TodayControlle.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 29.05.2024.
//

import UIKit

class TodayController: BaseListController {
    // MARK: - Properties
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        navigationController?.isNavigationBarHidden = true
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.identifier)
    }
    
    // MARK: - Delegate+DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.identifier, for: indexPath) as? TodayCell {
            return cell
        }
        
        return .init()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cliecked item at index \(indexPath.item)")
    }
    
    // MARK: - Helpers
}

extension TodayController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
