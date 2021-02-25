//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Евгений Тележенко on 13.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .white
        
        setConstraints()
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Add subview and Layout method
extension PhotosCollectionViewCell {
    
    func setConstraints() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

