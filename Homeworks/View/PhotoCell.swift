//
//  PhotoCell.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 23.07.2023.
//

import UIKit


/// Class for Photo cell in collection view
final class PhotoCell: UICollectionViewCell {
    
    var tap: ((UIImage) -> Void)?
    private var imageView = UIImageView(image: UIImage(named:"logo"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Updating photo in cell
    /// - Parameter model: photo model
    func updateCell(model: Photo) {
        DispatchQueue.global().async {
            if let url = URL(string: model.sizes.first?.url ?? ""), let data = try?Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    private func setupViews() {
        addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}



//final class PhotoCell: UICollectionViewCell {
//    private let photoView = UIImageView(image: UIImage(systemName: "person"))
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//            }
//        required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupViews() {
//        addSubview(photoView)
//        setupConstraints()
//    }
//
//    private func setupConstraints() {
//        photoView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            photoView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            photoView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            photoView.topAnchor.constraint(equalTo: topAnchor),
//            photoView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        photoView.image = nil
//    }
//
//}
