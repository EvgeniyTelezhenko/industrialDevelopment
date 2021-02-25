//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Евгений Тележенко on 11.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class PhotosTableViewCell: UITableViewCell {
    
    //MARK: Properties
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        return label
    }()
    
    private let arrowImage: UIImageView = {
        let iv = UIImageView()
        if #available(iOS 13.0, *) {
            iv.image = UIImage(systemName: "arrow.right")
        } else {
            // Fallback on earlier versions
        }
        iv.tintColor = .black
        iv.contentMode = .right
        return iv
    }()
    
    private let photoContainer =  UIView()
    
    private let myFirstImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = Helpers.photoArray[0]
        iv.layer.cornerRadius = 6
        iv.clipsToBounds = true
        return iv
    }()
    
    private let mySecondImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = Helpers.photoArray[1]
        iv.layer.cornerRadius = 6
        iv.clipsToBounds = true
        return iv
    }()
    
    private let myThirdImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = Helpers.photoArray[2]
        iv.layer.cornerRadius = 6
        iv.clipsToBounds = true
        return iv
    }()
    
    private let myFourthImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = Helpers.photoArray[3]
        iv.layer.cornerRadius = 6
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.backgroundColor = .white
        addViews()
        setConstraints()
    }
}

//MARK:Views adding and setting Layout methods
extension PhotosTableViewCell {
    
    func addViews() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrowImage)
        contentView.addSubview(myFirstImageView)
        contentView.addSubview(mySecondImageView)
        contentView.addSubview(myThirdImageView)
        contentView.addSubview(myFourthImageView)
    }
    
    func setConstraints() {
        photosLabel.snp.makeConstraints{ make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.leading.equalTo(contentView.snp.leading).offset(12)
        }
        arrowImage.snp.makeConstraints{ make in
            make.top.centerY.equalTo(photosLabel)
            make.trailing.equalTo(contentView.snp.trailing).offset(-12)
            make.width.equalTo(self.snp.height)
        }
        myFirstImageView.snp.makeConstraints{ make in
            make.top.equalTo(photosLabel.snp.bottom).offset(12)
            make.width.equalTo(contentView).multipliedBy(0.25).offset((-1 * (12 + 12 + 24)/4))
            make.height.equalTo(myFirstImageView.snp.width)
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
        }
        mySecondImageView.snp.makeConstraints{ make in
            make.top.width.height.equalTo(myFirstImageView)
            make.leading.equalTo(myFirstImageView.snp.trailing).offset(8)
        }

        myThirdImageView.snp.makeConstraints{ make in
            make.top.width.height.equalTo(myFirstImageView)
            make.leading.equalTo(mySecondImageView.snp.trailing).offset(8)
        }

        myFourthImageView.snp.makeConstraints{ make in
            make.top.width.height.equalTo(myFirstImageView)
            make.leading.equalTo(myThirdImageView.snp.trailing).offset(8)
        }
    }
}




