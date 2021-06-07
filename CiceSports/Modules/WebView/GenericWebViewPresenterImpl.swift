// GenericWebViewPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import WebKit

protocol GenericWebViewPresenterProtocol {
   func loadDataInWebView()
}

class GenericWebViewPresenterImpl: BasePresenter<GenericWebViewViewControllerProtocol, GenericWebViewRouterProtocol> {
    
    var interactor: GenericWebViewInteractorProtocol?
    
}


extension GenericWebViewPresenterImpl: GenericWebViewPresenterProtocol {
    
    internal func loadDataInWebView() {
        var url = ""
        #if DEV
        url = "https://www.planttext.com/"
        self.viewController?.loadWebView(data: url)
        #elseif PRE
        url = "https://www.google.es/?gws_rd=ssl"
        self.viewController?.loadWebView(data: url)
        #elseif PRO
        url = "http://icologic.co/"
        self.viewController?.loadWebView(data: url)
        #endif
        
    }
  
}

extension GenericWebViewPresenterImpl: WebKitPresenterProtocol {
    
    func webViewProvisionigNavigation(_ webView: WKWebView, navigation: WKNavigation!) {
        self.viewController?.loadActInd(show: true)
    }
    
    func webViewNavigationFailed(_ webView: WKWebView, navigation: WKNavigation!, error: Error) {
        self.viewController?.loadActInd(show: false)
    }
    
    func webViewNavigationActionRequest(_ webView: WKWebView, actionRequest: WKNavigationAction, handler: @escaping (WKNavigationActionPolicy) -> ()) {
        
        handler(.allow)
    }
    
    func webViewNavigationActionResponse(_ webView: WKWebView, response: WKNavigationResponse, handler: @escaping (WKNavigationResponsePolicy) -> ()) {
        
        handler(.allow)
    }
    
    func webViewDidFinish(_ webView: WKWebView, navigation: WKNavigation!) {
        self.viewController?.loadActInd(show: false)
    }
}


