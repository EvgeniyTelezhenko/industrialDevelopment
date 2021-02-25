//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Евгений Тележенко on 11.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    var post: Post? {
        didSet {
            guard let post = post else {return}
            authorLabel.text = post.author
            postImage.image = UIImage(named: "\(post.image)")
            descriptionLabel.text = post.description
            likesNumberLabel.text = String(post.likes)
            viewsNumberLabel.text = String(post.views)
        }
    }
    
    let authorLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        myLabel.textColor = .black
        myLabel.numberOfLines = 2
        
        return myLabel
    }()
    
    let postImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .black
        return iv
    }()
    
    let descriptionLabel: UILabel = {
    let myLabel = UILabel()
        myLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        myLabel.textColor = .systemGray
        myLabel.numberOfLines = 0
        
    return myLabel
}()
    
    let likesLabel: UILabel = {
    let myLabel = UILabel()
        myLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        myLabel.textColor = .black
        myLabel.text = "Likes:"
    return myLabel
}()
    let likesNumberLabel: UILabel = {

        let myLabel = UILabel()
            myLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            myLabel.textColor = .black
        myLabel.numberOfLines = 1

        return myLabel

    }()
    
    let viewsLabel: UILabel = {
    let myLabel = UILabel()
        myLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        myLabel.textColor = .black
    myLabel.numberOfLines = 1
        myLabel.text = "Views:"
    return myLabel
}()
    
    let viewsNumberLabel: UILabel = {

        let myLabel = UILabel()
            myLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            myLabel.textColor = .black
        myLabel.numberOfLines = 1

        return myLabel

    }()
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstraints()
        backgroundColor = .white
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}

extension PostTableViewCell {
    func setConstraints() {

        contentView.addSubview(authorLabel)
        contentView.addSubview(postImage)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(likesNumberLabel)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(viewsNumberLabel)
        
        authorLabel.snp.makeConstraints{ make in
            make.top.leading.equalTo(contentView).offset(16)
            make.trailing.equalTo(contentView).offset(-16)
        }
        
        postImage.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(authorLabel.snp.bottom)
            make.height.equalTo(postImage.snp.width)
        }
        
        descriptionLabel.snp.makeConstraints{ make in
            make.top.equalTo(postImage.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        likesLabel.snp.makeConstraints{ make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        likesNumberLabel.snp.makeConstraints{ make in
            make.top.bottom.equalTo(likesLabel)
            make.leading.equalTo(likesLabel.snp.trailing).offset(16)
        }
        viewsNumberLabel.snp.makeConstraints{ make in
            make.top.bottom.equalTo(viewsLabel)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        viewsLabel.snp.makeConstraints{ make in
            make.bottom.top.equalTo(likesLabel)
            make.trailing.equalTo(viewsNumberLabel.snp.leading).offset(-16)
        }
    }
    
    
}

