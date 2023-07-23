//
//  GroupCell.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 23.07.2023.
//

import UIKit

final class GroupCell: UITableViewCell {
    private var groupImageView = UIImageView(image: UIImage(systemName: "person"))
    private var title: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        return label
    }()
    
    private var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(groupImageView)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        setupConstraints()
    }
    
    private func setupConstraints() {
        groupImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                   groupImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                   groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                   groupImageView.heightAnchor.constraint(equalToConstant: 50),
                   groupImageView.widthAnchor.constraint(equalToConstant: 50),
                   
                   title.topAnchor.constraint(equalTo: groupImageView.bottomAnchor, constant: 10),
                   title.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 10),
                   title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                   
                   subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
                   subtitle.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 10),
                   subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                   subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//            groupImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            groupImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 50),
//            groupImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
//            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
//            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
                                    ])
        
    }
    
    
    
    
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

}
