//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 23.01.24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var headerView: ProfileHeaderView = {
        let header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    lazy var newButton: UIButton = {
        let button = UIButton(configuration: .filled(), primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New Button", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Профиль"
        
        view.addSubview(headerView)
        view.addSubview(newButton)
    
        viewWillLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
//        headerView.frame = view.frame
         let safeAreaLayoutGuide = view.safeAreaLayoutGuide
    NSLayoutConstraint.activate([
        headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        headerView.heightAnchor.constraint(equalToConstant: 220),
        
        newButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        newButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        newButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        newButton.heightAnchor.constraint(equalToConstant: 50)
    ])
    }

    
}
