//
//  AppsSearchController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 05.05.2024.
//

import UIKit

class AppsSearchController: UICollectionViewController {
    // MARK: - Properties
    
    // MARK: - Init
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBackground
        collectionView.register(
            SearchResultsCollectionViewCell.self,
            forCellWithReuseIdentifier: SearchResultsCollectionViewCell.identifier
        )
    }
    
    // MARK: - CollectionViewDelegate and DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultsCollectionViewCell.identifier, for: indexPath) as? SearchResultsCollectionViewCell { 
            //cell.backgroundColor = .blue
            return cell


        }
        return .init()
    }
}
// MARK: - +UICollectionViewDelegateFlowLayout
extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 250)
    }
}
