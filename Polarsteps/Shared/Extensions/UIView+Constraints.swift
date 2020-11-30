//
//  UIView+Constraints.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit

extension UIView {
  func pinEdges(to other: UIView) {
    leadingAnchor.constraint(equalTo: other.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: other.trailingAnchor).isActive = true
    topAnchor.constraint(equalTo: other.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
  }
}
