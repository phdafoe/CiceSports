//
//  DetalleConsejosViewController.swift
//  CiceSports
//
//  Created by cice on 03/06/2021.
//

import UIKit

class DetalleConsejosViewController: BaseViewController<DetalleConsejosPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    @IBOutlet weak var myTableViewDetalleConsejos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableViewDetalleConsejos.reloadData()
    }
    
    private func setupTableView() {
        self.myTableViewDetalleConsejos.delegate = self
        self.myTableViewDetalleConsejos.dataSource = self
        
        self.myTableViewDetalleConsejos.register(DetalleConsejoCell.nib, forCellReuseIdentifier: DetalleConsejoCell.identifier)
    }

}

extension DetalleConsejosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfRowInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableViewDetalleConsejos.dequeueReusableCell(withIdentifier: DetalleConsejoCell.identifier, for: indexPath) as! DetalleConsejoCell
        if let modelData = self.presenter?.informationForItem(indexPath: indexPath.row) {
            cell.configCell(data: modelData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
