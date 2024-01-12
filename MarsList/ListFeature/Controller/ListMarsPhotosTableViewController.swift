//
//  ListMarsPhotosTableViewController.swift
//  MarsList
//
//  Created by Bodgar Espinosa Miranda on 09/01/24.
//

import UIKit

/// Mock -> Harcodeado = Datos o valores que no vienen de ningún servicio y que solo sirven para realizar pruebas mas rapido en el front.
class ListMarsPhotosTableViewController: UITableViewController {

    var marsList: [MarsData.Photos] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MarsPhotoTableViewCell.self, forCellReuseIdentifier: "MarsPhotoTableViewCell")
        
        MarsPhotosAPI().callService { [weak self] result in
            switch result {
            case .success(let marsResponse):
                self?.marsList = marsResponse.photos
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
            cell.configure(viewModel: .init(name: mars.camera.fullName, isFavorite: mars.isFavorite))
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
