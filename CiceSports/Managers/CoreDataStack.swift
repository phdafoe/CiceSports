//
//  CoreDataStack.swift
//  CiceSports
//
//  Created by cice on 31/05/2021.
//

import Foundation

class CoreDataStack {
    
    static let shared = CoreDataStack()
    private let defaults = UserDefaults.standard
    private let defaultsKey = "lastRefresh"
    private let defaultsFirstTime = "firstTime"
    private let calender = Calendar.current
    
    func loadDataIfNeeded(completionHandler: (Bool) -> Void) {
        if isRefreshingRequired() {
            defaults.set(Date(), forKey: defaultsKey)
            completionHandler(true)
        } else {
            completionHandler(false)
        }
    }
    
    private func isRefreshingRequired() -> Bool {
        guard let lastRefreshing = defaults.object(forKey: defaultsKey) as? Date else {
            return true
        }
        if let diff = calender.dateComponents([.minute], from: lastRefreshing, to: Date()).minute, diff > 1 {
            return true
        } else {
            return false
        }
    }
    
    func isFirsTime(completionHandler: (Bool) -> ()) {
        let aux = defaults.value(forKey: defaultsFirstTime)
        if aux == nil {
            completionHandler(true)
        } else {
            completionHandler(false)
        }
    }
    
    func setValueFirstTime(value: Bool) {
        UserDefaults.standard.set(value, forKey:defaultsFirstTime)
    }
    
    //Gestion de datos - BBDD
    func setMenu(data: [MenuResponse]) {
        do {
            UserDefaults.standard.set(try PropertyListEncoder().encode(data), forKey: CoreDataStack.Constants.menu)
        } catch let error{
            print(error)
        }
    }
    
    func getMenu() -> [MenuResponse]? {
        var myData: [MenuResponse] = []
        if let data = UserDefaults.standard.value(forKey: CoreDataStack.Constants.menu) as? Data {
            do {
                myData = try PropertyListDecoder().decode([MenuResponse].self, from: data)
            } catch let error {
                print(error)
            }
        } else {
            return nil
        }
        return myData
    }
}

private extension CoreDataStack{
    struct Constants {
        static let menu = "menu"
    }
}
