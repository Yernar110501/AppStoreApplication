//
//  AppsSearchController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 05.05.2024.
//

import UIKit

class AppsSearchController: BaseListController {
    
    // MARK: - Properties
    private var appResults = [Result]()
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var timer: Timer?
    // MARK: - Init
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBackground
        collectionView.register(
            SearchResultsCollectionViewCell.self,
            forCellWithReuseIdentifier: SearchResultsCollectionViewCell.identifier
        )
        setupSearchController()
        
        fetchITunesApps(findWith: "instagram")
    }
    
    // MARK: - Helpers
    
    fileprivate func setupSearchController() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        //self.searchController.dimsBackgroundDuringPresentation = false
        //        self.searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate func fetchITunesApps(findWith text: String) {
        Service.shared.fetchApps(searchTerm: text) { result, error in
            
            if let error {
                print("failed to fetch error with: ", error)
                return
            }
            
            self.appResults = result?.results ?? []
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
// MARK: - +UISearchBarDelegate
extension AppsSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            Service.shared.fetchApps(searchTerm: searchText) { result, error in
                
                if let error {
                    print("failed to fetch error with: ", error)
                    return
                }
                
                self.appResults = result?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}


