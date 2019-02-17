//
//  ListViewController.swift
//  SampleObj
//
//  Created by Ashu Sharma 3 on 2/1/19.
//  Copyright © 2019 Ashu Sharma 3. All rights reserved.
//

import UIKit

struct ApiUrl {
     static let url : String = "https://jsonplaceholder.typicode.com/todos"
}

struct ReuseIdentifier{
    static let userCell : String = "UserCell"
}

class ListViewController: UITableViewController {
    fileprivate var viewModel:ViewModel!
    func configure(with viewModel:ViewModel){
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        let url = NSURL(string: ApiUrl.url)
        
       tableView.register(UserCell.nibForCell(), forCellReuseIdentifier: ReuseIdentifier.userCell)
        
        viewModel.downnLoadData(requestUrl: url!, success: {
            [weak self] (anyObject) in
            DispatchQueue.main.async {
              self?.tableView.reloadData()
            }
            
        }) { (error) in
            print(error)
        }
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.userCell, for: indexPath) as? UserCell else { return UITableViewCell() }
        let user = viewModel.model[indexPath.row]
        cell.setupUI(with: user)
        return cell
    }
    
}
