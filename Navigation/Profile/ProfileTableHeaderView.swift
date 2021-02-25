//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Евгений Тележенко on 10.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
 
class ProfileTableHeaderView: UIView {
    let myTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
}
