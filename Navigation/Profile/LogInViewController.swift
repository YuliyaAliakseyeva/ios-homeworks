//
//  LogInViewController.swift
//  Navigation
//
//  Created by Yuliya Vodneva on 8.02.24.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var logInScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "Logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
    }()
    
    private lazy var emailTextField: UITextField = {
        let email = UITextField(frame: .infinite)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.delegate = self
        return email
    }()
    
    private lazy var passwordTextField: UITextField = {
        let password = UITextField(frame: .infinite)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.delegate = self
        return password
    }()
    
    private lazy var lineBorder: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    
    private lazy var logInStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.clipsToBounds = true
        
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(lineBorder)
        stack.addArrangedSubview(passwordTextField)
        
        return stack
    }()
    
    private lazy var logInBotton: CustomButton = {
        let botton = CustomButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        return botton
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstrains()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    func setupView() {
        view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    private func addSubviews() {
        view.addSubview(logInScrollView)
        logInScrollView.addSubview(contentView)
        contentView.addSubview(logoImage)
        contentView.addSubview(logInStackView)
        contentView.addSubview(logInBotton)
    }
    
    func setupConstrains() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            logInScrollView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor
            ),
            logInScrollView.bottomAnchor.constraint(
                equalTo: safeAreaGuide.bottomAnchor
            ),
            logInScrollView.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor
            ),
            logInScrollView.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor
            ),
            
            contentView.topAnchor.constraint(
                equalTo: logInScrollView.topAnchor
            ),
            contentView.leadingAnchor.constraint(
                equalTo: logInScrollView.leadingAnchor
            ),
            contentView.trailingAnchor.constraint(
                equalTo: logInScrollView.trailingAnchor
            ),
            contentView.widthAnchor.constraint(
                equalTo: logInScrollView.widthAnchor
            ),
            
            logoImage.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 120
            ),
            logoImage.widthAnchor.constraint(
                equalToConstant: 100
            ),
            logoImage.heightAnchor.constraint(
                equalToConstant: 100
            ),
            logoImage.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            
            logInStackView.topAnchor.constraint(
                equalTo: logoImage.bottomAnchor,
                constant: 120
            ),
            logInStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            logInStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, 
                constant: -16
            ),
            logInStackView.heightAnchor.constraint(
                equalToConstant: 100
            ),
            
            emailTextField.widthAnchor.constraint(
                equalTo: logInStackView.widthAnchor
            ),
            
            lineBorder.widthAnchor.constraint(
                equalTo: logInStackView.widthAnchor
            ),
            lineBorder.heightAnchor.constraint(
                equalToConstant: 0.5
            ),
            
            passwordTextField.widthAnchor.constraint(
                equalTo: logInStackView.widthAnchor
            ),
            
            logInBotton.topAnchor.constraint(
                equalTo: logInStackView.bottomAnchor,
                constant: 16
            ),
            logInBotton.heightAnchor.constraint(
                equalToConstant: 50
            ),
            logInBotton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            logInBotton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            logInBotton.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -(120+100+120+100+16+50)
            )
        ])
    }
    
    func setupSubviews() {
        
        emailTextField.backgroundColor = .systemGray6
        emailTextField.placeholder = "Email or phone"
        emailTextField.textColor = .black
        emailTextField.keyboardType = UIKeyboardType.default
        emailTextField.returnKeyType = UIReturnKeyType.done
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.autocapitalizationType = .none
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.placeholder = "Password"
        passwordTextField.textColor = .black
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.isSecureTextEntry = true
        
        logInStackView.layer.cornerRadius = 10
        logInStackView.layer.borderWidth = 0.5
        logInStackView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        let img = UIImage(named: "blue_pixel")
        logInBotton.setBackgroundImage(img, for: .normal)
        logInBotton.setTitle("Log In", for: .normal)
        logInBotton.tintColor = .white
        logInBotton.clipsToBounds = true
        logInBotton.layer.cornerRadius = 10
        logInBotton.addTarget(self, action: #selector(buttonLogInPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonLogInPressed(_ sender: UIButton) {
        
        let profileViewController = ProfileViewController()
        
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeaboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeaboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func willShowKeaboard(_ notification: NSNotification) {
        let keaboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        logInScrollView.contentInset.bottom = keaboardHeight ?? 0.0
    }
    
    @objc func willHideKeaboard(_ notification: NSNotification) {
        logInScrollView.contentInset.bottom = 0.0
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
