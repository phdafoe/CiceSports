//
//  GenericWebViewViewController.swift
//  CiceSports
//
//  Created by cice on 31/05/2021.
//

import UIKit
import WebKit

protocol GenericWebViewViewControllerProtocol {
    func loadWebView(data: String)
    func loadActInd(show: Bool)
}

class GenericWebViewViewController: BaseViewController<GenericWebViewPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    // MARK: - Variables
    var myWebViewInContainer: WKWebView!
    var webViewManager: WebViewManager?
    
    // MARK: - IBOutlets
    @IBOutlet weak var myWebView: UIView!
    @IBOutlet weak var myActivityIndic: UIActivityIndicatorView!
    

    // MARK: - Cycle life VC
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configWebView()
        self.presenter?.loadDataInWebView()
    }
    
    private func configWebView() {
        self.title = "Cice Sports"
        
        self.myActivityIndic.isHidden = false
        self.myActivityIndic.startAnimating()
        
        let contentVC = WKUserContentController()
        let config = WKWebViewConfiguration()
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
        self.myWebViewInContainer = WKWebView(frame: self.myWebView.bounds, configuration: config)
        self.myWebViewInContainer.configuration.userContentController = contentVC
        
        self.myWebView.addSubview(self.myWebViewInContainer)
        
        self.webViewManager = WebViewManager(pWebView: self.myWebViewInContainer, pPresenter: self.presenter)
    }
    
}

extension GenericWebViewViewController: GenericWebViewViewControllerProtocol {
    internal func loadWebView(data: String) {
        self.myWebViewInContainer.load(URLRequest(url: URL(string: data)!))
    }
    
    internal func loadActInd(show: Bool) {
        if show {
            self.myActivityIndic.isHidden = !show
            self.myActivityIndic.startAnimating()
        } else {
            self.myActivityIndic.isHidden = !show
            self.myActivityIndic.stopAnimating()
        }
    }
}
