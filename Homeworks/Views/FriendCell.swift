//
//  FriendCell.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 23.07.2023.
//

import UIKit


final class FriendCell: UITableViewCell{
    
    var tap: ((String?, UIImage?) -> Void)?
    
    private var image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        return image
    }()
    
    private var onlineCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Name"
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellClick))
        addGestureRecognizer(recognizer)
        contentView.addSubview(image)
        contentView.addSubview(nameLabel)
        contentView.addSubview(onlineCircle)
        myConstr()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// Updating friend informarion in cell
    /// - Parameter model: Friend model
    func updateCell(model: Friend) {
        nameLabel.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
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
                    self.image.image = UIImage(data: data)
                }
            }
        }
    }
    private func myConstr(){
        image.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            image.heightAnchor.constraint(equalToConstant: 40),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            onlineCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            onlineCircle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            onlineCircle.heightAnchor.constraint(equalToConstant: 40),
            onlineCircle.widthAnchor.constraint(equalTo: onlineCircle.heightAnchor)
        ])
        
    }
    /// Tap for get friend
    @objc private func cellClick() {
        tap?(nameLabel.text, image.image)
    }
}

//final class FriendCell: UITableViewCell {
//    private var friendImageView = UIImageView(image: UIImage(systemName: "person"))
//    private var text: UILabel = {
//        let label = UILabel()
//        label.text = "Name"
//        label.textColor = .black
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .clear
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupViews() {
//        contentView.addSubview(friendImageView)
//        contentView.addSubview(text)
//        setupConstraints()
//    }
//
//    private func setupConstraints() {
//        friendImageView.translatesAutoresizingMaskIntoConstraints = false
//        text.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            // Constraints for friendImageView
//            friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            friendImageView.widthAnchor.constraint(equalToConstant: 40),
//            friendImageView.heightAnchor.constraint(equalToConstant: 40),
//
//            // Constraints for text label
//            text.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            text.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
//            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
//        ])
//    }
//        NSLayoutConstraint.activate([
//            friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
//        ])
//    }
        
        
        
        
        
        
        
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }


