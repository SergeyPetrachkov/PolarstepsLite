//
//  TripCell.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import SiberianVIPER
import Foundation
import Domain
import UIKit

protocol ITripState {
  var name: String { get }
  var date: Date { get }
  var startDate: Date { get }
  var endDate: Date { get }
  var tripLengthInKilometers: Double { get }
  var isPublic: Bool { get }
  var coverMedia: MediaInfo { get }
}

final class TripCellPresenter: GenericCollectionItemPresenter, ITripState {
  var name: String {
    self.dataContext.title
  }

  var date: Date {
    self.dataContext.startDate
  }

  var startDate: Date {
    self.dataContext.steps.first?.date ?? Date()
  }

  var endDate: Date {
    self.dataContext.endDate
  }

  var tripLengthInKilometers: Double {
    self.dataContext.totalDistance
  }

  var isPublic: Bool {
    self.dataContext.isVisible
  }

  var coverMedia: MediaInfo {
    self.dataContext.media
  }

  typealias ViewType = TripCell

  static var anyViewType: UIView.Type = ViewType.self

  let dataContext: Trip

  init(_ context: Trip) {
    self.dataContext = context
  }

  func setup(view: TripCell) {
    view.presenter = self
  }
}


final class TripCell: UICollectionViewCell {

  var presenter: TripCellPresenter? {
    didSet {
      self.tripView.state = presenter
      self.setNeedsLayout()
    }
  }

  let tripView: TripOverview = TripOverview(frame: .zero)

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentView.addSubview(self.tripView)
    self.isOpaque = true
    self.tripView.layer.cornerRadius = 12
    self.tripView.clipsToBounds = true
    self.tripView.backgroundColor = .tertiarySystemBackground
    self.tripView.isOpaque = true
    self.tripView.translatesAutoresizingMaskIntoConstraints = false
    self.tripView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
    self.tripView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    self.tripView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    self.tripView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
