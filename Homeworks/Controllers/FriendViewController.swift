//
//  FriendViewController.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 23.07.2023.
//

import UIKit

final class FriendViewController: UITableViewController {
    
    private let networkService: NetworkServiceProtocol
        private var models: [Friend]
        private var fileCache: FileCacheProtocol
        
        //Передаем в инициализатор протоколы
        
        init(networkService: NetworkServiceProtocol, models: [Friend], fileCache: FileCacheProtocol) {
            self.networkService = networkService
            self.models = models
            self.fileCache = fileCache
            super.init(style: .plain)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            models = fileCache.fetchFriends()
            tableView.reloadData()
            title = "Friends"
            view.backgroundColor = Theme.currentTheme.backgroundColor
            tableView.backgroundColor = Theme.currentTheme.backgroundColor
            navigationController?.navigationBar.tintColor = .black
            navigationController?.navigationBar.barTintColor = .white
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(tap))
            tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
            refreshControl = UIRefreshControl()
            refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
            getFriends()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            view.backgroundColor = Theme.currentTheme.backgroundColor
            tableView.backgroundColor = Theme.currentTheme.backgroundColor
            tableView.reloadData()
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            models.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
                return UITableViewCell()
            }
            let model = models[indexPath.row]
            cell.updateCell(model: model)
            cell.tap = { [weak self]  text, photo in self?.navigationController?.pushViewController(ProfileController(name: text, photo: photo, isUserProfile: false), animated: true)}
            return cell
        }
        /// getting friends from network or DB
        func getFriends() {
            networkService.getFriends { [weak self] result
                in
                switch result {
                case .success(let friends):
                    self?.models = friends
                    self?.fileCache.addFriends(friends: friends)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(_):
                    self?.models = self?.fileCache.fetchFriends() ?? []
                    DispatchQueue.main.async {
                        self?.showAlert()
                    }
                }
            }
        }
    }

    private extension FriendViewController {
        /// Says if can't take data from net
        private func showAlert(){
            let date = DateHelper.getDate(date: fileCache.fetchFriendDate())
            let alert = UIAlertController(title: "Проблема с получением данных", message: "Данные актуальны на \(date)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        /// Goes to user profile
        @objc func tap() {
            let animation = CATransition()
            animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
            animation.type = .moveIn
            animation.duration = 3
            navigationController?.view.layer.add(animation, forKey: nil)
            navigationController?.pushViewController(ProfileController(isUserProfile: true), animated: false)
        }
        
        /// Update info by pulling down
        @objc func update() {
            networkService.getFriends{ [weak self] result in switch result {
            case .success(let friends):
                self?.models = friends
                self?.fileCache.addFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
                DispatchQueue.main.async {
                    self?.refreshControl?.endRefreshing()
                }
            }
        }
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Friends"
//        view.backgroundColor = .white
//        tableView.backgroundColor = .white
//        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.barTintColor = .white
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 5
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return FriendCell()
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


