//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 26.01.24.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var photo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    lazy var name: UILabel = {
        let nameView = UILabel()
        nameView.text = "Рапунцель"
        nameView.textColor = .black
        nameView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameView.numberOfLines = 0
        nameView.translatesAutoresizingMaskIntoConstraints = false
        
        return nameView
    }()
    
    lazy var status: UILabel = {
        let textView = UILabel()
        textView.textColor = .darkGray
//        textView.text = "Status"
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var statusButton: UIButton = {
        let button = UIButton(configuration: .filled(), primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set status", for: .normal)
        
        return button
    }()
    
    lazy var statusField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        field.textColor = .black
        field.backgroundColor = .white
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
        self.addSubview(photo)
        self.addSubview(name)
        self.addSubview(status)
        self.addSubview(statusButton)
        self.addSubview(statusField)
        
        let photoConstrains = self.photoConstrains()
        let nameConstrains = self.nameConstrains()
        let statusConstrains = self.statusConstrains()
        let statusButtonConstrains = self.statusButtonConstrains()
        let statusFieldConstrains = self.statusFieldConstrains()
        
        NSLayoutConstraint.activate(photoConstrains + nameConstrains + statusButtonConstrains + statusConstrains + statusFieldConstrains)
        
        self.layoutSubviews()
        
        self.statusField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        self.statusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        
        
    }
    
    
    private func photoConstrains() -> [NSLayoutConstraint] {
        return [
            self.photo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.photo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.photo.heightAnchor.constraint(equalToConstant: 120),
            self.photo.widthAnchor.constraint(equalToConstant: 120)
            
        ]
        
    }
    
    private func nameConstrains() -> [NSLayoutConstraint] {
        return [
            self.name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            self.name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 16),
            self.name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            
        ]
        
    }
    private func statusConstrains() -> [NSLayoutConstraint] {
        return [
            self.status.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -68),
            self.status.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 16),
            self.status.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            
        ]
        
    }
    
    private func statusFieldConstrains() -> [NSLayoutConstraint] {
        return [
            self.statusField.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -16),
            self.statusField.leadingAnchor.constraint(equalTo: self.name.leadingAnchor),
            self.statusField.trailingAnchor.constraint(equalTo: self.name.trailingAnchor),
            self.statusField.heightAnchor.constraint(equalToConstant: 40)
            
        ]
        
    }
    
    private func statusButtonConstrains() -> [NSLayoutConstraint] {
        return [
            self.statusButton.topAnchor.constraint(equalTo: self.photo.bottomAnchor, constant: 50),
            self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        ]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.photo.clipsToBounds = true
        self.photo.layer.cornerRadius = self.photo.frame.height / 2
        self.photo.layer.borderColor = UIColor.white.cgColor
        self.photo.layer.borderWidth = 3
        
        self.statusButton.clipsToBounds = false
        self.statusButton.layer.cornerRadius = 4
        self.statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.statusButton.layer.shadowOpacity = 0.7
        self.statusButton.layer.shadowRadius = 4
        self.statusButton.layer.shadowColor = UIColor.black.cgColor
        
        self.statusField.layer.cornerRadius = 12
        self.statusField.layer.borderColor = UIColor.black.cgColor
        self.statusField.layer.borderWidth = 1
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        self.status.text = self.statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        
        self.statusText = self.statusField.text ?? "error"
    }
}
