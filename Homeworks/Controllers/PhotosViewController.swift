//
//  PhotosViewController.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 23.07.2023.
//

import UIKit



class PhotosViewController:UICollectionViewController {
    private let networkService = NetworkService()
    private var models: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "Photos")
        networkService.getPhotos{[weak self] photos in
            self?.models = photos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photos", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        let model = models[indexPath.row]
        cell.updateCell(model: model)
        return cell
    }
}
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}



//private let reuseIdentifier = "Cell"

//final class PhotosViewController: UICollectionViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "Photos"
//        collectionView.delegate = self
//        collectionView.dataSource = self
////        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
////            layout.delegate = self}
//        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.Identifier.photoCellIdentifier)
//        }
//
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as! PhotoCell
//        return cell
//    }
//}
//
//    extension PhotosViewController: UICollectionViewDelegateFlowLayout {
//            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let width = UIScreen.main.bounds.width
//            let cellSize = width / 2 - 20
//            return CGSize(width: cellSize, height: cellSize)
//
//        }
//
//    }

    