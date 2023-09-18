//
//  ViewController.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 07.07.2023.
//
// This is working project

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: 	view.bounds)
        webView.navigationDelegate = self
        return webView
            } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=" + AppCode.appCode +
        "&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token")
        webView.load(URLRequest(url: url!))
    }
    private func setupViews() {
        view.addSubview(webView)
    }

}

