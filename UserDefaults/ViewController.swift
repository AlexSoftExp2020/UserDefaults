//
//  ViewController.swift
//  UserDefaults
//
//  Created by Oleksii on 30.09.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // MARK: Properties
    let login = "Login"
    
    let loginTextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Login"
        return textField
    }()
    
    lazy var saveButton: UIButton = { [weak self] in
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Save"
        configuration.baseForegroundColor = .white
        configuration.baseBackgroundColor = .blue
        
        let button = UIButton(configuration: configuration,
                              primaryAction: UIAction { _ in
            self?.saveLoginButtonDidPress()
        })
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubviews()
        
        updateLabelView()
    }
    
    func updateLabelView() {
        let login = UserDefaults.standard.string(forKey: login)
        
        loginTextField.text = login
    }
    
    func addSubviews() {
        let stack = UIStackView(arrangedSubviews: [loginTextField, saveButton])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func saveLoginButtonDidPress() {
        UserDefaults.standard.setValue(loginTextField.text, forKey: login)
        
        updateLabelView()
    }
}

