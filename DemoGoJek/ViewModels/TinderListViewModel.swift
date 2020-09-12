//
//  TinderListViewModel.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

let storeFileName = "DemoGoJek"

class TinderListViewModel {
  var userResponse: UsersResponseModel?
  private var error: Error?
  private var service: RestAPIServiceProtocol!

  var updateUIBlock: (() -> Void)?

  init(service: RestAPIServiceProtocol) {
    self.service = service
  }

  var users: [User] {
    return userResponse?.results ?? []
  }

  func start() {
    assert(updateUIBlock != nil, "Missing code: updateUIBlock")
    loadCahcedData()
    service.getNews { [weak self] userResponseModel, error in
      guard let strongSelf = self else { return }
      strongSelf.error = error
      if let error = error {
        strongSelf.showError(error)
      } else if let userResponseModel = userResponseModel {
        strongSelf.userResponse = userResponseModel
        Storage.store(userResponseModel, to: .documents, as: storeFileName)
        strongSelf.updateUIBlock?()
      } else {
        // No data
        strongSelf.updateUIBlock?()
      }
    }
  }

  func loadCahcedData() {
    let userResponseModel = Storage.retrieve(storeFileName, from: .documents, as: UsersResponseModel.self)
    if let userResponseModel = userResponseModel {
      userResponse = userResponseModel
      updateUIBlock?()
    }
  }

  func showError(_ error: Error) {
    debugPrint(error.localizedDescription)
  }
}
