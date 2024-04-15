//
//  PostViewController.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 24.01.24.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "None"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        title = titlePost

        let infoBarButton = UIBarButtonItem(title: "Инфо", style: .done, target: self, action: #selector(pressedButton))
        
        navigationItem.rightBarButtonItem = infoBarButton
    }
    
        @objc func pressedButton () {
            let infoViewController = InfoViewController()
            
            infoViewController.modalTransitionStyle = .coverVertical
            infoViewController.modalPresentationStyle = .pageSheet
            present(infoViewController, animated: true)
    }
}
