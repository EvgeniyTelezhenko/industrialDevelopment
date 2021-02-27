//
//  BackgroundCalculator.swift
//  Navigation
//
//  Created by Евгений Тележенко on 30.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

// Добавил третью кнопку в tabBarController - нажимаем кнопку - запускается код, начинающий отсчет при выходе в background
class BackgroundCalculatorViewController: UIViewController {
    
//MARK:- Properties
    var position: UInt = 1
    var updateTimer: Timer?
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid

    var calculateButton = UIButton(frame: .zero)
    
    //MARK:- Views adding and setting observer to stop background timer
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calculateButton)
        setButtonConstraints()
        
        calculateButton.addTarget(self, action: #selector(calculateTapped(sender:)), for: .touchUpInside)
        view.backgroundColor = .white
        calculateButton.backgroundColor = .red
        NotificationCenter.default.addObserver(self, selector: #selector(reinstateBackgroundTask), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    deinit {
      NotificationCenter.default.removeObserver(self)
    }
    
    //MARK:- Button Tapped Method
    @objc func calculateTapped(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
          updateTimer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                             selector: #selector(calculateNextNumber),
                                             userInfo: nil,
                                             repeats: true)
          registerBackgroundTask()
        } else {
          updateTimer?.invalidate()
          updateTimer = nil
          if backgroundTask != .invalid {
            endBackgroundTask()
          }
        }
    }
    
    @objc func calculateNextNumber() {
      switch UIApplication.shared.applicationState {
      case .active:
        print("Active")
        
      case .background:
        let timeRemain = UIApplication.shared.backgroundTimeRemaining

        if timeRemain < Double(100.0) {
            let timeRemain = Int(UIApplication.shared.backgroundTimeRemaining)
        print("Background time remaining = \(timeRemain) seconds")
        }
      case .inactive:
        break
      @unknown default:
        fatalError("BackgroundCalculator calculateNextNumber")
      }
    }
    
    //MARK:- Background timer Setting methods
    func registerBackgroundTask() {
      backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
        self?.endBackgroundTask()
      }
      assert(backgroundTask != .invalid)
    }
    
    func endBackgroundTask() {
      print("Background task ended.")
      UIApplication.shared.endBackgroundTask(backgroundTask)
      backgroundTask = .invalid
    }
    
    @objc func reinstateBackgroundTask() {
      if updateTimer != nil && backgroundTask == .invalid {
        registerBackgroundTask()
      }
    }
}

extension BackgroundCalculatorViewController {
    func setButtonConstraints(){
        calculateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
