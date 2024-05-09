//
//  AppsSearchController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 05.05.2024.
//

import UIKit

class AppsSearchController: UICollectionViewController {
    // MARK: - Properties
    
    private var appResults = [Result]()
    
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
        
        fetchITunesApps()
    }
    
    // MARK: - Helpers
    
    fileprivate func fetchITunesApps() {
        Service.shared.fetchApps { result, error in
            
            if let error {
                print("failed to fetch error with: ", error)
                return
            }
            
            self.appResults = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - CollectionViewDelegate and DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultsCollectionViewCell.identifier, for: indexPath) as? SearchResultsCollectionViewCell {
            let appResult = appResults[indexPath.row]
            cell.configire(with: appResult)
            return cell
        }
        return .init()
    }
}
// MARK: - +UICollectionViewDelegateFlowLayout
extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 350)
    }
}
