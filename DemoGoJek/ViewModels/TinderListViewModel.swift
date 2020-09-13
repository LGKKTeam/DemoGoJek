//
//  TinderListViewModel.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

let storeFileName = "DemoGoJek"

enum TinderListType: Int {
  case normal
  case selected
}

class TinderListViewModel {
  var userResponse: UsersResponseModel?
  var selected: [User] = []
  private var error: Error?
  private var service: RestAPIServiceProtocol!
  private var type: TinderListType = .normal

  var updateUIBlock: (() -> Void)?

  init(service: RestAPIServiceProtocol) {
    self.service = service
  }

  var users: [User] {
    let normalList = userResponse?.results?.filter { (user) -> Bool in
      user.idUser?.value != nil && !selected.contains(where: { $0 == user })
    }
    return type == .normal ? normalList ?? [] : selected
  }

  func start() {
    loadCahcedData()
    getUsers()
  }

  func loadFavUser() {
    type = .selected
    updateUIBlock?()
  }

  func didSelect(_ user: User) {
    if type == .normal {
      if !selected.contains(where: { $0 == user }) {
        selected.append(user)
      }
      Storage.store(selected, to: .documents, as: storeFileName)
    }
  }

  func didDeSelect(_ user: User) {
    if type == .selected {
      selected.removeAll(where: { $0 == user })
      Storage.store(selected, to: .documents, as: storeFileName)
    }
  }

  func getUsers() {
    assert(updateUIBlock != nil, "Missing code: updateUIBlock")
    type = .normal
    service.getNews { [weak self] userResponseModel, error in
      guard let strongSelf = self else { return }
      strongSelf.error = error
      if let error = error {
        strongSelf.showError(error)
      } else if let userResponseModel = userResponseModel {
        strongSelf.userResponse = userResponseModel
        strongSelf.updateUIBlock?()
      } else {
        // No data
        strongSelf.updateUIBlock?()
      }
    }
  }

  private func loadCahcedData() {
    assert(updateUIBlock != nil, "Missing code: updateUIBlock")
    let users = Storage.retrieve(storeFileName, from: .documents, as: [User].self)
    if let users = users {
      selected = users
    }
  }

  private func showError(_ error: Error) {
    debugPrint(error.localizedDescription)
  }
}
