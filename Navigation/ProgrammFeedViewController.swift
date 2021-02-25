//
//  ProgrammFeedViewController.swift
//  Navigation
//
//  Created by Евгений Тележенко on 23.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ProgrammFeedViewController : UIViewController {
    
    let stackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fillEqually
        sv.backgroundColor = .purple
        return sv
    }()

    private lazy var firstSegueButton: UIButton = {
        let button = UIButton()
        setButton(button)
        button.setTitle("Segue 1", for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "backgroundFirstSegue"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "backgroundFirstSegue").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "backgroundFirstSegue").alpha(0.8), for: .highlighted)
        return button
    }()
    
    private lazy var secondSegueButton: UIButton = {
        
        let button = UIButton()
        setButton(button)
        button.setTitle("Segue 2", for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "backgroundSecondSegue"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "backgroundSecondSegue").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "backgroundSecondSegue").alpha(0.8), for: .highlighted)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstSegueButton)
        stackView.addArrangedSubview(secondSegueButton)
        setConstraints()
    }
    
}

extension ProgrammFeedViewController {
    
    func setButton(_ button: UIButton) {
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(pushForward) , for: .touchUpInside)
    }
    
    @objc func pushForward() {
let secondVC = PostViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
}

extension ProgrammFeedViewController {
    func setConstraints() {
        let constraints = [
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4),

            firstSegueButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            firstSegueButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            firstSegueButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//            firstSegueButton.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.5, constant: -1),

            secondSegueButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            secondSegueButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            secondSegueButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//            secondSegueButton.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.5, constant: -1)
//
        ]
        NSLayoutConstraint.activate(constraints)
    }
}


