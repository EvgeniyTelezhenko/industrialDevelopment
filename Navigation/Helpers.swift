//
//  Helpers.swift
//  Navigation
//
//  Created by Евгений Тележенко on 05.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class Helpers {
    let globalTimer: Double? = nil
    let myColor = UIColor.init(named: "TaskColor")
    
    static let postsArray: [[Post]] = [
       [ Post(author: "Discuss Cat", description: "Let's meow, collegues", image: "discussCat", likes: 3, views: 3),
        Post(author: "Grumpy Cat", description: "No", image: "grumpyCat", likes: 2, views: 3),
        Post(author: "Listen Cat", description: "I'm all - attention", image: "listenCat", likes: 1, views: 4),
        Post(author: "Weird Cat", description: "Meow?", image: "weirdCat", likes: 0, views: 91324)]
    ]
    
    static let photoArray =  [
        UIImage(named: "birdFeeder"),
        UIImage(named: "cheetah"),
        UIImage(named: "cliff"),
        UIImage(named: "cobWeb"),
        UIImage(named: "florence"),
        UIImage(named: "fox"),
        UIImage(named: "lake"),
        UIImage(named: "lighthouse"),
        UIImage(named: "man"),
        UIImage(named: "maple"),
        UIImage(named: "monkey"),
        UIImage(named: "paint"),
        UIImage(named: "performers"),
        UIImage(named: "river"),
        UIImage(named: "stream"),
        UIImage(named: "twoZebres"),
        UIImage(named: "wildLife"),
        UIImage(named: "windmill"),
        UIImage(named: "workplace"),
        UIImage(named: "zebra")
    ]
}

extension UIImage {
    func alpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

extension UIView {
    func turnOffAutoresizingMask() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

