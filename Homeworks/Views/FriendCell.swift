//
//  FriendCell.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 23.07.2023.
//

import UIKit


final class FriendCell: UITableViewCell{
    
    var tap: ((String?, UIImage?) -> Void)?
    
    private var friendImage = UIImageView(image:
                                            UIImage(systemName: "person"))
    
    
    
    private var onlineCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    private var text: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Name"
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = Theme.currentTheme.textColor
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellClick))
        addGestureRecognizer(recognizer)
        //        contentView.addSubview(friendImage)
        //        contentView.addSubview(name)
        //        contentView.addSubview(onlineCircle)
        //        myConstr()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(model: Friend) {
        text.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
        if let online = model.online {
            let isOnline = online == 1
            if isOnline {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .red
            }
        }
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try?Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.friendImage.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupViews() {
        contentView.addSubview(friendImage)
        contentView.addSubview(text)
        friendImage.addSubview(onlineCircle)
        setupConstraints()
    }
    
    private func setupConstraints(){
        friendImage.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            friendImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            friendImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            friendImage.widthAnchor.constraint(equalToConstant: 50),
            friendImage.heightAnchor.constraint(equalTo: friendImage.widthAnchor),
            friendImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            text.leadingAnchor.constraint(equalTo: friendImage.trailingAnchor, constant: 10),
            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            onlineCircle.widthAnchor.constraint(equalToConstant: 20),
            onlineCircle.heightAnchor.constraint(equalTo: onlineCircle.widthAnchor),
            onlineCircle.bottomAnchor.constraint(equalTo: friendImage.bottomAnchor),
            onlineCircle.trailingAnchor.constraint(equalTo: friendImage.trailingAnchor, constant: 10)
        ])
    }
    
    @objc private func cellClick() {
        tap?(text.text, friendImage.image)
    }
}
