//
//  TripOverview.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit
import SDWebImage
import DateHelper

final class TripOverview: UIView {
  // MARK: - DataContext
  var state: ITripState? {
    didSet {
      guard let state = state else {
        return
      }
      self.configure(state)
    }
  }

  // MARK: - UI
  private enum Config {
    static let sidePadding: CGFloat = 20
  }
  private let coverImage: UIImageView = {
    let image = UIImageView(frame: .zero)
    image.contentMode = .scaleAspectFill
    return image
  }()

  private let almostInvisibleCover: UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = UIColor(white: 0, alpha: 0.15)
    return view
  }()

  private let titleLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.numberOfLines = 3
    label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    label.textColor = UIColor.white
    return label
  }()

  private let dateLabel: TripMetricLabel = {
    let label = TripMetricLabel(frame: .zero)
    return label
  }()

  private let durationLabel: TripMetricLabel = {
    let label = TripMetricLabel(frame: .zero)
    return label
  }()

  private let lengthLabel: TripMetricLabel = {
    let label = TripMetricLabel(frame: .zero)
    return label
  }()

  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .gray
    self.addSubview(self.coverImage)
    self.addSubview(self.almostInvisibleCover)
    self.addSubview(self.titleLabel)
    self.addSubview(self.dateLabel)
    self.addSubview(self.durationLabel)
    self.addSubview(self.lengthLabel)
    self.setupLayout()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods
  private func setupLayout() {
    self.coverImage.translatesAutoresizingMaskIntoConstraints = false
    self.coverImage.pinEdges(to: self)
    self.almostInvisibleCover.translatesAutoresizingMaskIntoConstraints = false
    self.almostInvisibleCover.pinEdges(to: self)
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Config.sidePadding).isActive = true
    self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Config.sidePadding).isActive = true
  }

  private func configure(_ state: ITripState) {
    self.titleLabel.text = state.name
    self.accessibilityIdentifier = "\(state.name) container"
    self.titleLabel.accessibilityIdentifier = state.name

    self.coverImage.sd_setImage(with: URL(string: state.coverMedia.imagePath))

    let calendar = Calendar.current
    let month = calendar.component(.month, from: state.startDate)
    let year = calendar.component(.year, from: state.startDate)
    let monthName = DateFormatter().monthSymbols[month - 1]
    self.dateLabel.set(number: Double(year), text: monthName)

    self.lengthLabel.set(number: state.tripLengthInKilometers, text: "KM".localized)
    self.setNeedsLayout()
  }
}