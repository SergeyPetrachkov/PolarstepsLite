//
//  ActionButton.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit

public struct ActionButtonConfig {

  public let buttonBackground: UIColor
  public let buttonTitle: String
  public let buttonTitleColor: UIColor
  public let buttonWidthRatio: CGFloat
  public let buttonHeight: CGFloat
  public let cornerRadius: CGFloat

  public init(
    buttonBackground: UIColor = UIColor.clear,
    buttonTitle: String,
    buttonTitleColor: UIColor = UIColor(red: 85.0/255, green: 153.0/255, blue: 236.0/255, alpha: 1),
    buttonWidthRatio: CGFloat = 0.8,
    buttonHeight: CGFloat = 50,
    cornerRadius: CGFloat = 0
  ) {
    self.buttonBackground = buttonBackground
    self.buttonTitle = buttonTitle
    self.buttonTitleColor = buttonTitleColor
    self.buttonWidthRatio = buttonWidthRatio
    self.buttonHeight = buttonHeight
    self.cornerRadius = cornerRadius
  }
}

final class ActionButton: UIButton {

  private(set) var config: ActionButtonConfig
  var tapHandler: (() -> Void)? = nil

  lazy var activityIndicator: UIActivityIndicatorView = {
    let style: UIActivityIndicatorView.Style = UIActivityIndicatorView.Style.medium
    let view = UIActivityIndicatorView(style: style)
    return view
  }()

  init(_ config: ActionButtonConfig) {
    self.config = config
    super.init(frame: .zero)
    self.addTarget(self, action: #selector(self.didTapSelf), for: .touchUpInside)
    self.clipsToBounds = true
    self.setup(with: config)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func setup(with config: ActionButtonConfig) {
    self.layer.cornerRadius = config.cornerRadius
    self.setTitle(config.buttonTitle, for: .normal)
    self.setTitleColor(config.buttonTitleColor, for: .normal)
    self.setTitleColor(UIColor(red: 218.0/255,
                               green: 218.0/255,
                               blue: 218.0/255,
                               alpha: 1),
                       for: .disabled)
    self.setBackgroundImage(UIImage.from(color: config.buttonBackground), for: .normal)
    self.config = config
  }

  @objc
  private func didTapSelf() {
    self.tapHandler?()
  }

  func enterPendingState() {
    self.isUserInteractionEnabled = false
    self.titleLabel?.alpha = 0

    DispatchQueue.main.async {
      self.activityIndicator.frame.origin = CGPoint(x: self.bounds.width/2 - (self.activityIndicator.frame.width) / 2,
                                                    y: self.bounds.height/2 - (self.activityIndicator.frame.height) / 2)

      self.addSubview(self.activityIndicator)
      self.activityIndicator.startAnimating()
    }
  }

  func exitPendingState() {
    self.isUserInteractionEnabled = true
    self.titleLabel?.alpha = 1
    DispatchQueue.main.async {
      self.activityIndicator.stopAnimating()
      self.activityIndicator.removeFromSuperview()
    }
  }

  func disable() {
    self.isEnabled = false
  }

  func enable() {
    self.isEnabled = true
  }
}
