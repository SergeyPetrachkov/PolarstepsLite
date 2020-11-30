//
//  MyTripsDisplayManager.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit
import SiberianVIPER

final class MyTripsDisplayManager: SiberianCollectionViewManager {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }

  override func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.bounds.width - 32
    let height = width * 0.75
    return CGSize(width: width, height: height)
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
  }
}
