//
//  AppsSearchController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 05.05.2024.
//

import UIKit

struct Result2 {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: URL
    let screenshotUrls: [URL]
}

class AppsSearchController2: UICollectionViewController {
    // MARK: - Properties
    
    private var appResults = [Result2]()
    
    enum SectionType {
        case info([Result2])
        case screenshots([Result2])
    }
    
    var pageData: [[SectionType]] = [[
        .info([
            .init(trackName: "a", primaryGenreName: "b", averageUserRating: 1, artworkUrl100: URL(string: "https://fsaf.kz")!, screenshotUrls: [] ),
            .init(trackName: "a", primaryGenreName: "b", averageUserRating: 1, artworkUrl100: URL(string: "https://fsaf.kz")!, screenshotUrls: [] ),
            .init(trackName: "a", primaryGenreName: "b", averageUserRating: 1, artworkUrl100: URL(string: "https://fsaf.kz")!, screenshotUrls: [] ),
        ])
        ,
        .screenshots([
            
            .init(trackName: "a", primaryGenreName: "b", averageUserRating: 1, artworkUrl100: URL(string: "https://fsaf.kz")!, screenshotUrls: [] ),
            .init(trackName: "a", primaryGenreName: "b", averageUserRating: 1, artworkUrl100: URL(string: "https://fsaf.kz")!, screenshotUrls: [] ),
            .init(trackName: "a", primaryGenreName: "b", averageUserRating: 1, artworkUrl100: URL(string: "https://fsaf.kz")!, screenshotUrls: [] ),
            .init(trackName: "a", primaryGenreName: "b", averageUserRating: 1, artworkUrl100: URL(string: "https://fsaf.kz")!, screenshotUrls: [] ),
            .init(trackName: "a", primaryGenreName: "b", averageUserRating: 1, artworkUrl100: URL(string: "https://fsaf.kz")!, screenshotUrls: [] ),
        ])
    ]]
    
    private var sections: [SectionType] = []
    
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
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "cell1"
        )
        
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell2")
        
        //fetchITunesApps()
        setupSections()
        
    }
    
    // MARK: - Helpers
    
    fileprivate func setupSections() {
        sections = [
            .info(appResults),
            .screenshots(appResults)
        ]
    }
    
    //    fileprivate func fetchITunesApps() {
    //        Service.shared.fetchApps { result, error in
    //
    //            if let error {
    //                print("failed to fetch error with: ", error)
    //                return
    //            }
    //
    //            self.appResults = result
    //            DispatchQueue.main.async {
    //                self.collectionView.reloadData()
    //            }
    //        }
    //    }
    
    // MARK: - CollectionViewDelegate and DataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return pageData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageData[section].count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch pageData[indexPath.section][indexPath.item] {
        case .info(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            cell.backgroundColor = .red
            return cell
        case .screenshots(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
            cell.backgroundColor = .green
            return cell
        }
        
        
    }
}
//MARK: - +UICollectionViewDelegateFlowLayout
extension AppsSearchController2: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 350)
    }
}

