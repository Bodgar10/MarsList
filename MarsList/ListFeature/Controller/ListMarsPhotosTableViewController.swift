//
//  ListMarsPhotosTableViewController.swift
//  MarsList
//
//  Created by Bodgar Espinosa Miranda on 09/01/24.
//

import UIKit

class ListMarsPhotosTableViewController: UITableViewController {

    var marsList: [Mars] = [
        .init(title: "Foto Uno"),
        .init(title: "Foto Dos"),
        .init(title: "Foto Tres"),
        .init(title: "Foto cuatro")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MarsPhotoTableViewCell.self, forCellReuseIdentifier: "MarsPhotoTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return marsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "MarsPhotoTableViewCell",
            for: indexPath
        ) as? MarsPhotoTableViewCell {
            let mars = marsList[indexPath.row]
            cell.configure(viewModel: .init(name: mars.title))
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
