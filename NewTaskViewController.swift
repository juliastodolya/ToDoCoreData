//
//  NewTaskViewController.swift
//  ToDoCoreData
//
//  Created by Юлия on 10.02.2021.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    private lazy var newTaskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 1
        )
        button.setTitle("Save task", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(newTaskTextField)
        setupConstraints()
    }
    
    private func setupConstraints() {
        newTaskTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newTaskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            newTaskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            newTaskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    @objc private func save() {
        
    }
}
