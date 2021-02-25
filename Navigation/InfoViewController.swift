//
//  InfoViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    private lazy var showAlertButton: UIButton = {
        let button = UIButton()
        button.center = view.center
        button.setTitle("Show Alert", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(showAlertButton)
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
@objc func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Удалить пост?", message: "Пост нельзя будет восстановить", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            print("Удалить")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension InfoViewController {
    
    func setConstraints() {
        showAlertButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            showAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showAlertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

