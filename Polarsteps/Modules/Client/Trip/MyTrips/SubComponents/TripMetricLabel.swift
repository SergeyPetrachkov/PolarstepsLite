//
//  TripMetricLabel.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit

final class TripMetricLabel: UIView {
  // MARK: - Essentials
  private static let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    formatter.numberStyle = .decimal
    return formatter
  }()
  // MARK: - UI properties
  private let stack: UIStackView = {
    let view = UIStackView(frame: .zero)
    view.axis = .vertical
    view.alignment = .leading
    return view
  }()

  private let topLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    label.textColor = UIColor.white
    return label
  }()

  private let bottomLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.textColor = UIColor.white
    return label
  }()

  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(self.stack)
    self.stack.addArrangedSubview(self.topLabel)
    self.stack.addArrangedSubview(self.bottomLabel)
    self.stack.translatesAutoresizingMaskIntoConstraints = false
    self.topLabel.translatesAutoresizingMaskIntoConstraints = false
    self.bottomLabel.translatesAutoresizingMaskIntoConstraints = false
    self.stack.pinEdges(to: self)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Interface

  func set(number: Double, text: String) {
    self.set(topText: TripMetricLabel.numberFormatter.string(from: NSNumber(value: number)) ?? "", bottomText: text)
  }

  func set(number: Int, text: String) {
    self.set(topText: "\(number)", bottomText: text)
  }

  func set(topText: String, bottomNumber: Double) {
    self.set(topText: topText, bottomText: TripMetricLabel.numberFormatter.string(from: NSNumber(value: bottomNumber)) ?? "")
  }

  func set(topText: String, bottomText: String) {
    self.topLabel.text = topText
    self.bottomLabel.text = bottomText
    self.setNeedsLayout()
  }
}
