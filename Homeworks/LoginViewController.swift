////
////  LoginViewController.swift
////  Homeworks
////
////  Created by Иван  Балабай  on 07.07.2023.
////
//
// import Foundation
// import UIKit
//
//// depricated after first homework
//
// class LoginViewController: UIViewController {
//
//    let logoImageView: UIImageView = {
//            let imageView = UIImageView()
//            imageView.image = UIImage(named: "gblogo")
//            imageView.contentMode = .scaleAspectFit
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            return imageView
//        }()
//
//        let titleLabel: UILabel = {
//            let label = UILabel()
//            label.text = "Авторизация"
//            label.textAlignment = .center
//            label.font = UIFont.boldSystemFont(ofSize: 24)
//            label.translatesAutoresizingMaskIntoConstraints = false
//            return label
//        }()
//
//        let usernameTextField: UITextField = {
//            let textField = UITextField()
//            textField.placeholder = "Логин"
//            textField.borderStyle = .roundedRect
//            textField.translatesAutoresizingMaskIntoConstraints = false
//            textField.layer.borderWidth = 1.0
//            textField.layer.borderColor = UIColor.black.cgColor
//            textField.layer.cornerRadius = 5.0
//            return textField
//        }()
//
//        let passwordTextField: UITextField = {
//            let textField = UITextField()
//            textField.placeholder = "Пароль"
//            textField.borderStyle = .roundedRect
//            textField.translatesAutoresizingMaskIntoConstraints = false
//            textField.isSecureTextEntry = true
//            textField.layer.borderWidth = 1.0
//            textField.layer.borderColor = UIColor.black.cgColor
//            textField.layer.cornerRadius = 5.0
//            return textField
//        }()
//
//
//        let loginButton: UIButton = {
//            let button = UIButton(type: .system)
//            button.setTitle("Войти", for: .normal)
//            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
//            button.translatesAutoresizingMaskIntoConstraints = false
//            button.backgroundColor = .black
//            button.setTitleColor(.white, for: .normal)
//            button.layer.borderWidth = 2.0
//            button.layer.borderColor = UIColor.black.cgColor
//            button.layer.cornerRadius = 5.0
//            return button
//        }()
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            setupUI()
//            loginButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
//        }
//
//        func setupUI() {
//            view.backgroundColor = .white
//
//            view.addSubview(logoImageView)
//            view.addSubview(titleLabel)
//            view.addSubview(usernameTextField)
//            view.addSubview(passwordTextField)
//            view.addSubview(loginButton)
//
//            NSLayoutConstraint.activate([
//                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//                logoImageView.widthAnchor.constraint(equalToConstant: 200),
//                logoImageView.heightAnchor.constraint(equalToConstant: 200),
//
//                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
//
//                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
//                usernameTextField.heightAnchor.constraint(equalToConstant: 40),
//
//                passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
//                passwordTextField.heightAnchor.constraint(equalToConstant: 40),
//
//                loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
//                loginButton.heightAnchor.constraint(equalToConstant: 60)
//            ])
//        }
//
//    @objc private func tap() {
//        let tab1 = UINavigationController(rootViewController: FriendViewController())
//        let tab2 = UINavigationController(rootViewController: GroupsViewController())
//        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
//
//        tab1.tabBarItem.title = "Friends"
//        tab2.tabBarItem.title = "Groups"
//        tab3.tabBarItem.title = "Photos"
//
//        let controllers = [tab1, tab2, tab3]
//
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = controllers
//
//        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//              let firstWindow = firstScene.windows.first
//        else {
//            return
//            }
//        firstWindow.rootViewController = tabBarController
//        }
//    }
