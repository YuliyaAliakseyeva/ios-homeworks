//
//  FeedViewController.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 23.01.24.
//

import UIKit

class FeedViewController: UIViewController {
    
    var firstPost = Post(title: "Первый пост")
    
    private lazy var firstPostButton: UIButton = {
        let button = UIButton(configuration: .filled(), primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к посту 1", for: .normal)
        
        return button
    }()
    
    private lazy var secondPostButton: UIButton = {
        let button = UIButton(configuration: .filled(), primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к посту 2", for: .normal)

        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.clipsToBounds = true
        
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        
        stack.addArrangedSubview(self.firstPostButton)
        stack.addArrangedSubview(self.secondPostButton)
        
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        title = "Лента"
        
        view.addSubview(stackView)
        
        setupConstrains()
        
        firstPostButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        secondPostButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
        
    private func setupConstrains() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 15
            ),
            stackView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -15
            ),
            stackView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 15
            ),
            stackView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -15)
        ])
    }

        @objc func buttonPressed(_ sender: UIButton) {
            
            let postViewController = PostViewController()
            
            postViewController.titlePost = firstPost.title
            
            self.navigationController?.pushViewController(postViewController, animated: true)
        }
    }
    

    


