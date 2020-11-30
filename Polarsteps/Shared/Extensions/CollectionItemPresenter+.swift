//
//  CollectionItemPresenter+.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import SiberianVIPER
import UIKit

public extension GenericCollectionItemPresenter {
  var viewAnyType: UIView.Type {
    return ViewType.self
  }

  func setupAny(view: UIView) {
    setup(view: view as! ViewType)
  }

  static func registerIn(_ tableView: UITableView) {
    let identifier = String(describing: ViewType.self)
    tableView.register(anyViewType, forCellReuseIdentifier: identifier)
  }

  static func registerIn(_ collectionView: UICollectionView) {
    let identifier = String(describing: ViewType.self)
    collectionView.register(anyViewType, forCellWithReuseIdentifier: identifier)
  }
}

public extension Sequence where Element == CollectionItemPresenter.Type {
  func registerIn(_ tableView: UITableView) {
    self.forEach { model in
      let identifier = String(describing: model.anyViewType.self)
      tableView.register(model.anyViewType, forCellReuseIdentifier: identifier)
    }
  }

  func registerIn(_ collectionView: UICollectionView) {
    self.forEach { model in
      let identifier = String(describing: model.anyViewType.self)
      collectionView.register(model.anyViewType, forCellWithReuseIdentifier: identifier)
    }
  }
}
