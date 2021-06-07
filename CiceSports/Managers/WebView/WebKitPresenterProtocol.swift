//
//  WebKitPresenterProtocol.swift
//  CiceSports
//
//  Created by cice on 04/06/2021.
//

import Foundation
import WebKit

protocol WebKitPresenterProtocol: class {
    
    func webViewProvisionigNavigation(_ webView: WKWebView, navigation: WKNavigation!)
    func webViewDidFinish(_ webView:WKWebView, navigation: WKNavigation!)
    func webViewNavigationActionRequest(_ webView: WKWebView, actionRequest: WKNavigationAction, handler: @escaping (WKNavigationActionPolicy) -> ())
    func webViewNavigationActionResponse(_ webView: WKWebView, response: WKNavigationResponse, handler: @escaping (WKNavigationResponsePolicy) -> ())
    func webViewNavigationFailed(_ webView: WKWebView, navigation: WKNavigation!, error: Error)
    
}

extension WebKitPresenterProtocol {
    func webViewProvisionigNavigation(_ webView: WKWebView, navigation: WKNavigation!) {}
    func webViewDidFinish(_ webView:WKWebView, navigation: WKNavigation!) {}
    func webViewNavigationActionRequest(_ webView: WKWebView, actionRequest: WKNavigationAction, handler: @escaping (WKNavigationActionPolicy) -> ()) {}
    func webViewNavigationActionResponse(_ webView: WKWebView, response: WKNavigationResponse, handler: @escaping (WKNavigationResponsePolicy) -> ()) {}
    func webViewNavigationFailed(_ webView: WKWebView, navigation: WKNavigation!, error: Error) {}
}
