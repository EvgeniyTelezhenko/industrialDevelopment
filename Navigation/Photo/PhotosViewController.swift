//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Евгений Тележенко on 13.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class PhotosViewController: UIViewController {
    
    //MARK: Properties
    private let offSet = CGFloat(8)
    
    private lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(
            PhotosCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self)
        )
        cv.backgroundColor = .white
        self.title = "phtot gallery"
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        view.addSubview(photoCollection)
        setConstraints()
        self.title = "Photo Gallery"
    }
}

//MARK: Layout method
extension PhotosViewController {
    func setConstraints() {
        photoCollection.snp.makeConstraints{ make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
}

//MARK: CollectionView Delegate
extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Helpers.photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 4 * offSet) / 3
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return offSet
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return offSet    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: offSet, bottom: 8, right: offSet)
    }
}

//MARK: CollectionView DataSource
extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        cell.imageView.image = Helpers.photoArray[indexPath.row]
    return cell
    }
    
}
