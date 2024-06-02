//
//  AppFullScreenController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 02.06.2024.
//

import UIKit

class AppFullScreenController: UITableViewController {
    // MARK: - Private Properties
    
    // MARK: - Public Properties
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserInterface()
    }
    
    // MARK: - DataSource + Delegate
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = TodayCell()
//        return header
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 450
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            return AppFullScreenHeaderCell()
            
        }
        let cell = AppFullScreenDescriptionCell()
        return cell
    }
    
    // MARK: - Helpers
    
    private func configureUserInterface() {
        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Actions
}
