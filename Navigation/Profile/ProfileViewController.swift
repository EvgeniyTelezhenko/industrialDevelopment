//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Евгений Тележенко on 23.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    //Mark: Properties
    private let profileHeaderView = ProfileHeaderView()
    private lazy var postView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tv.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "Profile"
        setViews()
        setConstraints()
    }
}

//MARK: Delegate
extension ProfileViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return Helpers.postsArray[0].count
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        }else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
}

//Mark: DataSource
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: PhotosTableViewCell.self),
                for: indexPath
            ) as? PhotosTableViewCell {
                return cell
            }
        }
        if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: PostTableViewCell.self),
                for: indexPath
            ) as? PostTableViewCell {
                cell.post = Helpers.postsArray[0][indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
}

//Mark: Setting for Subviews
extension ProfileViewController {
    
    func setViews() {
        view.backgroundColor = .lightGray
        view.addSubview(postView)
        postView.backgroundColor = .lightGray
    }
    
    func setConstraints () {
//        let constraints = [
//            postView.topAnchor.constraint(equalTo: view.topAnchor),
//            postView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            postView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            postView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ]
//        NSLayoutConstraint.activate(constraints)
//    }
    postView.snp.makeConstraints { make in
        make.centerX.centerY.width.height.equalToSuperview()
}
}
}
//Mark: Push method
extension ProfileViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
}

//
