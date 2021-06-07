//
//  WebViewManager.swift
//  CiceSports
//
//  Created by cice on 04/06/2021.
//

import Foundation
import WebKit

class WebViewManager: NSObject {
    
    private weak var wkWebview: WKWebView?
    private weak var presenter: WebKitPresenterProtocol?
    
    init(pWebView: WKWebView?, pPresenter: Any?) {
        super.init()
        self.wkWebview = pWebView
        self.presenter = pPresenter as? WebKitPresenterProtocol
        self.setup()
    }
    
    private func setup() {
        self.wkWebview?.navigationDelegate = self
    }
    
}

extension WebViewManager: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.presenter?.webViewProvisionigNavigation(webView, navigation: navigation)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.presenter?.webViewDidFinish(webView, navigation: navigation)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        self.presenter?.webViewNavigationActionRequest(webView, actionRequest: navigationAction, handler: decisionHandler)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        self.presenter?.webViewNavigationActionResponse(webView, response: navigationResponse, handler: decisionHandler)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.presenter?.webViewNavigationFailed(webView, navigation: navigation, error: error)
    }
    
}
