//
//  MyTripsController.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import SiberianVIPER
import UIKit

final class MyTripsController: UIViewController {
  private let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                  collectionViewLayout: UICollectionViewFlowLayout())
  private let refreshControl = UIRefreshControl()

  lazy var displayManager: MyTripsDisplayManager? = {
    guard let provider = self.presenter as? AnySiberianCollectionSource else {
      return nil
    }
    let manager = MyTripsDisplayManager(provider: provider,
                                        scrollDirection: .vertical)
    self.collectionView.delegate = manager
    return manager
  }()

  var presenter: MyTripsPresenterInput?

  init(moduleIn: MyTrips.ModuleIn) {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .secondarySystemBackground
    self.view.addSubview(self.collectionView)
    self.collectionView.dataSource = self.displayManager
    self.collectionView.backgroundColor = .secondarySystemBackground
    self.view.addSubview(self.collectionView)
//    self.collectionView.frame = self.view.bounds
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    self.collectionView.pinEdges(to: self.view)
    TripCellPresenter.registerIn(self.collectionView)
    self.collectionView.alwaysBounceVertical = true
    self.presenter?.start()
    self.refreshControl.addTarget(self, action: #selector(self.didPullToRefresh), for: .valueChanged)
    self.collectionView.refreshControl = self.refreshControl
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  @objc
  private func didPullToRefresh() {

  }
}

extension MyTripsController: MyTripsPresenterOutput {
  func didChange(viewModel: MyTrips.ViewModel) {
    self.collectionView.reloadData()
  }

  func showError(with text: String) {
    ToastFactory.showBottomToast(message: text)
  }

  func didEnterPendingState() {

  }

  func didExitPendingState() {

  }
}
