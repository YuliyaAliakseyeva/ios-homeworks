//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 23.01.24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let headerView = ProfileHeaderView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .lightGray
        title = "Профиль"
        view.addSubview(headerView)
        self.viewWillLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        headerView.frame = view.frame
    }

    
}
