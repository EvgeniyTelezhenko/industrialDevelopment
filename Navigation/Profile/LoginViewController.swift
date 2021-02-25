//
//  LoginViewController.swift
//  Navigation
//
//  Created by Евгений Тележенко on 05.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//



import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate{
    
    // MARK:- Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let logoView: UIImageView = {
        let vkView = UIImageView()
        vkView.contentMode = .scaleAspectFit
        vkView.backgroundColor = .white
        vkView.image = UIImage(#imageLiteral(resourceName: "logo.png"))
        return vkView
    }()
    
    private let emailTextField: UITextField = {
        let myField = UITextField()
        myField.placeholder = "Email or phone"
        return myField
    }()
    
    private let passCodeTextField: UITextField = {
        let passCodeTextField = UITextField()
        passCodeTextField.isSecureTextEntry = true
        passCodeTextField.placeholder = "Password"
        return passCodeTextField
    }()
    
    private let containerView: UIView = {
        let myStackView = UIView()
        if #available(iOS 13.0, *) {
            myStackView.backgroundColor = UIColor.systemGray6
        } else {
            // Fallback on earlier versions
        }
        myStackView.layer.cornerRadius = 10
        myStackView.layer.borderWidth = 0.5
        myStackView.layer.borderColor = UIColor.lightGray.cgColor
        return myStackView
    }()
    
    private let emailInsetView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passcodeInsetView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(loggedIn(_:)) , for: .touchUpInside)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        return button
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.turnOffAutoresizingMask()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        addObservers()
        setViews()
        setupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeObservers()
    }
}

//MARK: Helpers
extension LogInViewController {
    
    func setTextField(field: UITextField) {
        field.textColor = .black
        field.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        field.tintColor = UIColor(named: "TaskColor")
        field.autocapitalizationType = .none
        field.textAlignment = .left
    }
}

//MARK: Subviews setting methods
extension LogInViewController {
    
    func setViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoView)
        contentView.addSubview(containerView)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passCodeTextField)
        containerView.addSubview(emailInsetView)
        containerView.addSubview(passcodeInsetView)
        containerView.addSubview(dividerView)
        setTextField(field: emailTextField)
        setTextField(field: passCodeTextField)
        contentView.addSubview(logInButton)
    }
    
    //MARK:- Constraints
    func setupConstraints() {
        [
            scrollView,
            logoView,
            containerView,
            emailTextField,
            passCodeTextField,
            logInButton,
            contentView,
            containerView
        ].forEach({$0.turnOffAutoresizingMask()})
        
        let constriants = [
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            
            containerView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            dividerView.heightAnchor.constraint(equalToConstant: 0.5),
            dividerView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            dividerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            emailInsetView.topAnchor.constraint(equalTo: containerView.topAnchor),
            emailInsetView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            emailInsetView.bottomAnchor.constraint(equalTo: dividerView.topAnchor) ,
            emailInsetView.widthAnchor.constraint(equalToConstant: 8),
            
            passcodeInsetView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            passcodeInsetView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            passcodeInsetView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            passcodeInsetView.widthAnchor.constraint(equalToConstant: 8),
            
            emailTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailInsetView.trailingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: dividerView.topAnchor),
            
            passCodeTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            passCodeTextField.leadingAnchor.constraint(equalTo: passcodeInsetView.trailingAnchor),
            passCodeTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            passCodeTextField.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            
            logInButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ]
        NSLayoutConstraint.activate(constriants)
    }
    
    @objc func loggedIn(_ button: UIButton) {
        if #available(iOS 13.0, *) {
            let secondVC = ProfileViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        } else {
            // Fallback on earlier versions
        }
       
    }
}

//MARK: Keyboard methods
extension LogInViewController {
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                                as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height - self.tabBarController!.tabBar.frame.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height - self.tabBarController!.tabBar.frame.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}


//MARK: Lifecycle methods
extension LogInViewController {
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

