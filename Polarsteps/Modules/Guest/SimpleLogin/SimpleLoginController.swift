//
//  SimpleLoginController.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit
import SiberianSwift

final class SimpleLoginController: UIViewController {
  // MARK: - UI stuff
  private enum Config {
    static let sidePadding: CGFloat = 20
    static let interItemSpacing: CGFloat = 10
  }

  private let emailField: UITextField = {
    let field = UITextField(frame: .zero)
    field.enablesReturnKeyAutomatically = true
    field.placeholder = "Email".localized
    field.keyboardType = .emailAddress
    field.borderStyle = .roundedRect
    field.accessibilityIdentifier = "email"
    field.backgroundColor = .secondarySystemBackground
    return field
  }()

  private let passwordField: UITextField = {
    let field = UITextField(frame: .zero)
    field.enablesReturnKeyAutomatically = true
    field.isSecureTextEntry = true
    field.borderStyle = .roundedRect
    field.placeholder = "Password".localized
    field.accessibilityIdentifier = "password"
    field.backgroundColor = .secondarySystemBackground
    return field
  }()

  private let buttonConfig = ActionButtonConfig(buttonTitle: "Submit".localized)
  private lazy var submitButton: ActionButton = {
    let button = ActionButton(self.buttonConfig)
    return button
  }()

  private let stack = UIStackView(frame: .zero)

  // MARK: - Life cycle

  private let viewModel: SimpleLoginViewModel
  
  init(_ viewModel: SimpleLoginViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Let's make it nested and call from here, so we're sure this gets called only once without any overcomplications
    func configureUI() {
      self.view.backgroundColor = UIColor.systemBackground
      self.view.addSubview(self.stack)
      self.stack.axis = .vertical
      self.stack.spacing = Config.interItemSpacing
      self.stack.alignment = .center
      self.stack.addArrangedSubview(self.emailField)
      self.stack.addArrangedSubview(self.passwordField)
      self.stack.addArrangedSubview(self.submitButton)

      self.stack.translatesAutoresizingMaskIntoConstraints = false
      self.stack.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
      self.stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
      self.stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

      self.emailField.translatesAutoresizingMaskIntoConstraints = false
      self.emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
      self.emailField.leadingAnchor.constraint(equalTo: self.stack.leadingAnchor, constant: Config.sidePadding).isActive = true
      self.emailField.trailingAnchor.constraint(equalTo: self.stack.trailingAnchor, constant: -Config.sidePadding).isActive = true

      self.passwordField.translatesAutoresizingMaskIntoConstraints = false
      self.passwordField.leadingAnchor.constraint(equalTo: self.stack.leadingAnchor, constant: Config.sidePadding).isActive = true
      self.passwordField.trailingAnchor.constraint(equalTo: self.stack.trailingAnchor, constant: -Config.sidePadding).isActive = true
      self.passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true

      self.submitButton.translatesAutoresizingMaskIntoConstraints = false
      self.submitButton.widthAnchor.constraint(equalTo: self.stack.widthAnchor, multiplier: self.buttonConfig.buttonWidthRatio).isActive = true
      self.submitButton.heightAnchor.constraint(equalToConstant: self.buttonConfig.buttonHeight).isActive = true
    }

    self.configureUI()

    self.submitButton.tapHandler = { [weak self] in
      guard let self = self else {
        assertionFailure("Wow!")
        return
      }

      self.viewModel.submitCredentials(login: self.emailField.text, password: self.passwordField.text)
    }
  }

  // MARK: - Private methods
  private func configureUI() {

  }
}
