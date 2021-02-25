

import Foundation
import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    //MARK: Properties
    private  let screenBounds = UIScreen.main.bounds
    private let tabBarHeight = 49
    private lazy var statusText: String = ""
    private let avatarImageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let statusLabel = UILabel()
    private let statusTextField = UITextField()
    private let crossButton = UIButton()
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        return UIButton()
    }()
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = screenBounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        blurEffectView.alpha = 0
        return blurEffectView
    }()
    private lazy var taskAnimationView: UIImageView = {
        let newView = UIImageView(frame: avatarImageView.frame)
        setImageView(newView)
        self.addSubview(newView)
        return newView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        avatarImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        avatarImageView.addGestureRecognizer(tapGesture)
        
        backgroundColor = .lightGray
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        avatarImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        avatarImageView.addGestureRecognizer(tapGesture)
        
        backgroundColor = .lightGray
        setViews()
        setConstraints()
    }
}

//MARK: Setting subviews methods
extension ProfileHeaderView {
    
    func setFullNameLabel () {
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.text = "Burping cat"
        fullNameLabel.textColor = .black
    }
    
    func setStatusLabel () {
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.text = "Eating vegetables"
        statusLabel.textColor = .gray
    }
    func setStatusTextField () {
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.layer.cornerRadius = 12
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
    }
    
    func setMyStatusButton() {
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.backgroundColor = .blue
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.layer.cornerRadius = CGFloat(4)
        setStatusButton.addTarget(self, action: #selector (changeStatus), for: .touchUpInside)
    }
    
    func setCrossButton() {
        
        if #available(iOS 13.0, *) {
            crossButton.setBackgroundImage(UIImage(systemName: "square.split.diagonal.2x2"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            crossButton.setBackgroundImage(UIImage(systemName: "square.split.diagonal.2x2")!.alpha(0.3), for: .selected)
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            crossButton.setBackgroundImage(UIImage(systemName: "square.split.diagonal.2x2")!.alpha(0.3), for: .highlighted)
        } else {
            // Fallback on earlier versions
        }
        crossButton.addTarget(self, action: #selector(crossTap), for: .touchUpInside)
        crossButton.tintColor = .gray
        crossButton.layer.cornerRadius = 41
        crossButton.alpha = 0
        crossButton.clipsToBounds = true
    }
    
    func setImageView(_ imageView: UIImageView) {
        imageView.image = UIImage(#imageLiteral(resourceName: "chiton.png"))
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 55
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
    }
}

//MARK: Subviews adding and layout
extension ProfileHeaderView {
    
    func setViews() {
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(avatarImageView)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(blurView)
        addSubview(crossButton)
        setFullNameLabel()
        setImageView(self.avatarImageView)
        setStatusLabel()
        setStatusTextField()
        setMyStatusButton()
        setCrossButton()
    }
    
    func setConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
            make.top.leading.equalToSuperview().offset(16)
        }
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        statusLabel.snp.makeConstraints{ make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(24)
            make.leading.equalTo(fullNameLabel.snp.leading)
            make.trailing.equalTo(fullNameLabel.snp.trailing)
        }
        statusTextField.snp.makeConstraints{ make in
            make.top.equalTo(statusLabel.snp.bottom).offset(8)
            make.leading.equalTo(statusLabel.snp.leading)
            make.trailing.equalTo(statusLabel.snp.trailing)
            make.height.equalTo(40)
        }
        setStatusButton.snp.makeConstraints{ make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        crossButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(40)
        }
    }
}

//MARK: Textfield functions for task
extension ProfileHeaderView {
    
    @objc func setStatus() {
        self.statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text ?? ""
    }
    @objc func changeStatus() {
        statusLabel.text = statusText
    }
}

//MARK: Animation HomeTask

/*- Основная идея - сделал доп вью для блюра. Сделал ее альфу нулевой. После нажатия на аватар, бэкграунд постепенно заятгивавет блюр. Можно было просто полупрозрачную вью. Но блюр - как-то правильнее смотрится.  Далее, для красоты, чтобы не менять текущую вью, сделал дополнительную, наложил ее на основную и работал с ней. Далее, для того, чтобы точно растянуть и сужать по необходимой ширине, чтобы свести анимацию прям точно, ввел константы, которые работают относительно экрана устройства, а не относительно родительских вью.
 
 */
extension ProfileHeaderView {
    
    //MARK: Tap avatar function
    @objc func tap() {
        
        self.bringSubviewToFront(blurView)
        self.bringSubviewToFront(taskAnimationView)
        self.bringSubviewToFront(crossButton)
        
        let scaleConstant = self.screenBounds.width / self.avatarImageView.frame.width
        let newCenterY = self.screenBounds.height  / 2 - CGFloat(tabBarHeight)
        
        let scaleXAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        scaleXAnimation.fromValue = 1
        scaleXAnimation.toValue = scaleConstant
        let scaleYAnimation = CABasicAnimation(keyPath: "transform.scale.y")
        scaleYAnimation.fromValue = 1
        scaleYAnimation.toValue = scaleConstant
        
        let frameXAnimation = CABasicAnimation(keyPath: "position.x")
        frameXAnimation.toValue = self.screenBounds.width / 2
        let frameYAnimation = CABasicAnimation(keyPath: "position.y")
        frameYAnimation.toValue = newCenterY
        
        let cornerAnimation = CABasicAnimation(keyPath: "cornerRadius")
        cornerAnimation.toValue = 0
        
        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.toValue = 0
        
        let group = CAAnimationGroup()
        group.isRemovedOnCompletion = false
        group.fillMode = .forwards
        group.animations = [
            scaleXAnimation,
            scaleYAnimation,
            frameXAnimation,
            frameYAnimation,
            cornerAnimation,
            borderWidthAnimation
        ]
        group.duration = 0.5
        taskAnimationView.layer.add(group, forKey: "scale_frame")
        
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 1 } completion: {
                finished in
                
                self.taskAnimationView.layer.cornerRadius = 0
                self.taskAnimationView.layer.borderWidth = 0
                
                let finalOrigin = CGPoint(
                    x: 0,
                    y: (newCenterY - (self.avatarImageView.frame.height * scaleConstant) / 2)
                )
                
                self.taskAnimationView.frame = .init(
                    origin: finalOrigin,
                    size: CGSize(width: self.screenBounds.width, height: self.screenBounds.width)
                )
                
                self.taskAnimationView.layer.removeAllAnimations()
                
                UIView.animate(withDuration: 0.3) {
                    self.crossButton.alpha = 1
                }
            }
    }
    
    // MARK: Cross tap action
    @objc func crossTap() {
      
        let resizeConstant = self.screenBounds.width / self.avatarImageView.frame.width
        
        UIView.animate(withDuration: 0.3) {
            self.crossButton.alpha = 0
        } completion: {
            isEnded in
            
            let scaleBackXAnimation = CABasicAnimation(keyPath: "transform.scale.x")
            scaleBackXAnimation.toValue = self.avatarImageView.frame.width / self.taskAnimationView.frame.width
            let scaleBackYAnimation = CABasicAnimation(keyPath: "transform.scale.y")
            scaleBackYAnimation.toValue = self.avatarImageView.frame.width / self.taskAnimationView.frame.width
            
            let frameBackXAnimation = CABasicAnimation(keyPath: "position.x")
            frameBackXAnimation.toValue = self.avatarImageView.center.x
            let frameBackYAnimation = CABasicAnimation(keyPath: "position.y")
            frameBackYAnimation.toValue = self.avatarImageView.center.y
            
            let cornerBackAnimation = CABasicAnimation(keyPath: "cornerRadius")
            cornerBackAnimation.toValue = 55 * resizeConstant
            
            let borderBackWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
            borderBackWidthAnimation.toValue = 3 * resizeConstant
            
            let groupBack = CAAnimationGroup()
            groupBack.isRemovedOnCompletion = false
            groupBack.fillMode = .forwards
            groupBack.duration = 0.5
            groupBack.animations = [
                scaleBackXAnimation,
                scaleBackYAnimation,
                frameBackXAnimation,
                frameBackYAnimation,
                cornerBackAnimation,
                borderBackWidthAnimation
            ]
          
            self.taskAnimationView.layer.add(groupBack, forKey: "back")
            
            UIView.animate(withDuration: 0.5) {
                self.blurView.alpha = 0
            } completion: {
                finised in
                self.taskAnimationView.frame = self.avatarImageView.frame
                self.setImageView(self.taskAnimationView)
                self.taskAnimationView.layer.removeAllAnimations()
            }
        }
    }
}


//            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
//            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
//
//            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
//            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
//            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

//            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 24),
//            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
//            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
//
//let constraints = [
////
////            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
////            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
////            statusTextField.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
////            statusTextField.heightAnchor.constraint(equalToConstant: 40),
////
//            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
//            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
//
//            crossButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            crossButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            crossButton.widthAnchor.constraint(equalToConstant: 40),
//            crossButton.heightAnchor.constraint(equalTo: crossButton.widthAnchor)
//        ]
//        NSLayoutConstraint.activate(constraints)
