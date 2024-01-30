//
//  FeedViewController.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 23.01.24.
//

import UIKit

class FeedViewController: UIViewController {
    
    var firstPost = Post(title: "Первый пост")
    
    private lazy var postButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к посту", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        title = "Лента"
        
        view.addSubview(postButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 15
            ),
            postButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -15
            ),
            postButton.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            ),
            postButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        postButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
    }
        
        

        @objc func buttonPressed(_ sender: UIButton) {
            
            let postViewController = PostViewController()
            
            postViewController.titlePost = firstPost.title
            
            self.navigationController?.pushViewController(postViewController, animated: true)
            
 
        }
    }
    

    


