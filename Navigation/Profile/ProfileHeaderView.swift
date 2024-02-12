//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 26.01.24.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let nameView = UILabel()
        nameView.text = "Рапунцель"
        nameView.textColor = .black
        nameView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameView.numberOfLines = 0
        nameView.translatesAutoresizingMaskIntoConstraints = false
        return nameView
    }()
    
    lazy var statusLabel: UILabel = {
        let textView = UILabel()
        textView.textColor = .darkGray
        textView.text = "Status"
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton(configuration: .filled(), primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set status", for: .normal)
        return button
    }()
    
    lazy var statusTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        field.textColor = .black
        field.backgroundColor = .white
        field.placeholder = "Update your status"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode = .always
        return field
    }()
    
    private var statusText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawSelf() {
        self.backgroundColor = .gray
        
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
        
        setupConstrains()
     
        layoutSubviews()
        
        self.statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        self.setStatusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    private func setupConstrains() {
        let safeAreaLayoutGuide = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            
            self.fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            self.fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            self.fullNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.fullNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 25),
            self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.statusTextField.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -6),
            self.statusTextField.leadingAnchor.constraint(equalTo: self.fullNameLabel.leadingAnchor),
            self.statusTextField.trailingAnchor.constraint(equalTo: self.fullNameLabel.trailingAnchor),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.statusLabel.bottomAnchor.constraint(equalTo: self.statusTextField.topAnchor, constant: -5),
            self.statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            self.statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.statusLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
        self.avatarImageView.layer.borderColor = UIColor.white.cgColor
        self.avatarImageView.layer.borderWidth = 3
        
        self.setStatusButton.clipsToBounds = false
        self.setStatusButton.layer.cornerRadius = 4
        self.setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.setStatusButton.layer.shadowOpacity = 0.7
        self.setStatusButton.layer.shadowRadius = 4
        self.setStatusButton.layer.shadowColor = UIColor.black.cgColor
        
        self.statusTextField.layer.cornerRadius = 12
        self.statusTextField.layer.borderColor = UIColor.black.cgColor
        self.statusTextField.layer.borderWidth = 1
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        self.statusLabel.text = self.statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = self.statusTextField.text ?? "error"
    }
}
