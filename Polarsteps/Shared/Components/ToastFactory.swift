//
//  ToastFactory.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit
import JuicyToast

enum ToastFactory {
  static func showCenteredToast(message: String, delay: TimeInterval = 0.0) {
    let toastConfig = JuicyToastConfig(
      messageConfig: ToastMessageConfig(
        message: message,
        textAlignment: .center,
        textColor: .white,
        font: UIFont.systemFont(ofSize: 16, weight: .medium)
      ),
      actionConfig: nil,
      backgroundColor: .black, paddings: .init(top: 10, left: 10, bottom: 10, right: 10)
    )
    let toast = JuicyToastAssembly.makeToast(config: toastConfig)
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
      JuicyToastManager.shared.showToast(toast, duration: 4, position: .middle)
    }
  }

  static func showBottomToast(message: String, delay: TimeInterval = 0.0) {
    let toastConfig = JuicyToastConfig(
      messageConfig: ToastMessageConfig(
        message: message,
        textAlignment: .center,
        textColor: .white,
        font: UIFont.systemFont(ofSize: 16, weight: .medium)
      ),
      actionConfig: nil,
      backgroundColor: .black, paddings: .init(top: 10, left: 10, bottom: 10, right: 10)
    )
    let toast = JuicyToastAssembly.makeToast(config: toastConfig)
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
      JuicyToastManager.shared.showToast(toast, duration: 4, position: .bottom(60))
    }
  }
}
