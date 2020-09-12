//
//  RestAPIServiceProtocol.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

protocol RestAPIServiceProtocol {
  func getNews(completion: @escaping ((UsersResponseModel?, Error?) -> Void))
}
