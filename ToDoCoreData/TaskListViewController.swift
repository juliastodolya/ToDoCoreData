//
//  TaskListViewController.swift
//  ToDoCoreData
//
//  Created by Юлия on 10.02.2021.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        title = "Task List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 195/255
        )
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTask)
        )
    }

    @objc private func addTask() {
        let newTaskVC = NewTaskViewController()
        present(newTaskVC, animated: true)
    }

}

