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
  private let stack = UIStackView(frame: .zero)

  private let topLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    return label
  }()

  private let bottomLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    return label
  }()

  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(self.stack)
    self.stack.addArrangedSubview(self.topLabel)
    self.stack.addArrangedSubview(self.bottomLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Interface

  func set(number: Double, text: String) {
    self.topLabel.text = TripMetricLabel.numberFormatter.string(from: NSNumber(value: number))
    self.bottomLabel.text = text
    self.setNeedsLayout()
  }

  func set(number: Int, text: String) {
    self.topLabel.text = "\(number)"
    self.bottomLabel.text = text
    self.setNeedsLayout()
  }
}
