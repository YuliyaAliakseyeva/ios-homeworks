//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 15.02.24.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let id = "PostTableViewCell"
    
    private let authorPostView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionPostView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imagePostView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let likesPostView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let viewsPostView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .default,
            reuseIdentifier: reuseIdentifier
        )
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: PostForProfile) {
        authorPostView.text = data.author
        descriptionPostView.text = data.description
        imagePostView.image = UIImage(named: data.image)
        likesPostView.text = "Likes: \(data.likes)"
        viewsPostView.text = "Views: \(data.views)"
    }
    
    private func setupUI() {
        contentView.addSubview(authorPostView)
        contentView.addSubview(descriptionPostView)
        contentView.addSubview(imagePostView)
        contentView.addSubview(likesPostView)
        contentView.addSubview(viewsPostView)
        
        NSLayoutConstraint.activate([
            authorPostView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            authorPostView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            authorPostView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            
            imagePostView.topAnchor.constraint(
                equalTo: authorPostView.bottomAnchor,
                constant: 12
            ),
            imagePostView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor
            ),
            imagePostView.heightAnchor.constraint(
                equalTo:imagePostView.widthAnchor
            ),
            imagePostView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            
            descriptionPostView.topAnchor.constraint(
                equalTo: imagePostView.bottomAnchor,
                constant: 16
            ),
            descriptionPostView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            descriptionPostView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            
            likesPostView.topAnchor.constraint(
                equalTo: descriptionPostView.bottomAnchor,
                constant: 16
            ),
            likesPostView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            likesPostView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -16
            ),
            
            viewsPostView.topAnchor.constraint(
                equalTo: descriptionPostView.bottomAnchor,
                constant: 16
            ),
            viewsPostView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            viewsPostView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -16
            )
        ])
        
        authorPostView.font = .systemFont(ofSize: 20, weight: .bold)
        authorPostView.textColor = .black
        authorPostView.numberOfLines = 2
        
        descriptionPostView.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionPostView.textColor = .systemGray
        descriptionPostView.numberOfLines = 0
        
        imagePostView.contentMode = .scaleAspectFit
        imagePostView.backgroundColor = .black
        
        likesPostView.font = .systemFont(ofSize: 16, weight: .regular)
        likesPostView.textColor = .black
        
        viewsPostView.font = .systemFont(ofSize: 16, weight: .regular)
        viewsPostView.textColor = .black
    }
}
