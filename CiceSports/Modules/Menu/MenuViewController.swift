//
//  MenuViewController.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit
import MessageUI

protocol MenuViewControllerProtocol {
    
}

class MenuViewController: BaseViewController<MenuPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.presenter?.fetchDataFromHeroku()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }
    
    private func setupTableView() {
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: HeaderTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: HeaderTableViewCell.defaultReuseIdentifier)
        
        self.myTableView.register(UINib(nibName: BodyTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: BodyTableViewCell.defaultReuseIdentifier)
    }
    
}

extension MenuViewController: MenuViewControllerProtocol {
    
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return self.presenter?.getNumberOfRowInSections() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = self.myTableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.defaultReuseIdentifier, for: indexPath) as! HeaderTableViewCell
            if let modelData = self.presenter?.getInformationObject(indexPath: indexPath.row) {
               cell.configCell(data: modelData)
            } else {
                return UITableViewCell()
            }
            return cell
        default:
            let cell = self.myTableView.dequeueReusableCell(withIdentifier: BodyTableViewCell.defaultReuseIdentifier, for: indexPath) as! BodyTableViewCell
            cell.delegate = self
            if let modelData = self.presenter?.getInformationObject(indexPath: indexPath.row) {
               cell.configCell(data: modelData)
            } else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 180
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("Aqui Andres mete gamba")
        default:
            switch indexPath.row {
            case 0:
                self.presenter?.showWebSite()
            case 1:
                self.presenter?.navigateToMusic()
            case 2:
                self.presenter?.navigateToCalendar()
            case 3:
                self.presenter?.navigateToConsejos()
            default:
                self.sendMail()
            }
        }
    }
    
    
    private func sendMail(){
        let mailComposeVC = configuredMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        if MFMailComposeViewController.canSendMail() {
            present(mailComposeVC, animated: true, completion: nil)
        } else {
            present(showAlertVC(title: "heeyyy", message: "No se puede enviar el mail"),
                    animated: true,
                    completion: nil)
        }
        
    }
}

extension MenuViewController: BodyTableViewCellDelegate {
    func sendInfoToVC(data: Menu) {
        print("Se ha pulsado el boton \(data.literal ?? "")")
    }
}

extension MenuViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

