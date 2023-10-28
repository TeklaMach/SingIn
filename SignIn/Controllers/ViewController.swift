//
//  ViewController.swift
//  SignIn
//
//  Created by Tekla Matcharashvili on 27.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mainTitle: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Sign In"
        textLabel.font = UIFont.boldSystemFont(ofSize: 32)
        textLabel.textColor = .black
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let socialLogosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let haveAnAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Don’t have an account.Sign Up", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let backgroundImage = UIImageView(image: UIImage(named: "backgroundImage"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImage, at: 0)

        view.addSubview(profileImageView)
        view.addSubview(mainTitle)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signInButton)
        view.addSubview(socialLogosStackView)
        view.addSubview(haveAnAccountButton)
        
        let googleLogo = UIImageView(image: UIImage(named: "google"))
        let facebookLogo = UIImageView(image: UIImage(named: "facebook"))
        let linkedinLogo = UIImageView(image: UIImage(named: "linkedin"))
        
        socialLogosStackView.addArrangedSubview(googleLogo)
        socialLogosStackView.addArrangedSubview(facebookLogo)
        socialLogosStackView.addArrangedSubview(linkedinLogo)
        
        NSLayoutConstraint.activate([
            
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 100),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),

            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 50),
            signInButton.widthAnchor.constraint(equalToConstant: 292),
            signInButton.heightAnchor.constraint(equalToConstant: 45),
            
            socialLogosStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            socialLogosStackView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            
            haveAnAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            haveAnAccountButton.topAnchor.constraint(equalTo: socialLogosStackView.bottomAnchor, constant: 32),
        ])
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    @objc private func signInButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter both email and password.")
            return
        }
        
        let homeVC = HomePageViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
