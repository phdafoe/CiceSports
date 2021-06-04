// ConsejosPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ConsejosPresenterProtocol {
   func getData()
}

class ConsejosPresenterImpl: BasePresenter<ConsejosViewControllerProtocol, ConsejosRouterProtocol> {
    
    var arrayConsejosGenerales: [ConsejosGenerale] = []
    weak var delegate: TablePresenterDelegate?
    
    func updateData(){
        self.delegate?.dataSourceUpdated()
    }
    
}

extension ConsejosPresenterImpl: ConsejosPresenterProtocol {
    func getData() {
        self.updateData()
    }
  
}

extension ConsejosPresenterImpl: TablePresenterProtocol {
 
    func numberOfCell(_ tableType: TableType, section: Int) -> Int {
        return arrayConsejosGenerales.count
    }
    
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any {
        self.arrayConsejosGenerales[indexPath.row]
    }
    
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {
        self.router?.showDetail(data: self.arrayConsejosGenerales[indexPath.row].messageArray ?? [])
    }
    
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}
