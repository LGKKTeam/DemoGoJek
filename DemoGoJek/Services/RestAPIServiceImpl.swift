//
//  RestAPIServiceImpl.swift
//  DemoVSee
//
//  Created by Coc Coc on 9/8/20.
//

import Foundation

class RestAPIServiceImpl: RestAPIServiceProtocol {
  func getNews(completion: @escaping ((UsersResponseModel?, Error?) -> Void)) {
    let urlString = "https://randomuser.me/api/?results=50"
    request(urlString: urlString, completion: completion)
  }

  func request(urlString: String, completion: @escaping ((UsersResponseModel?, Error?) -> Void)) {
    let url = URL(string: urlString)
    guard let _url = url else {
      let dic = [NSLocalizedDescriptionKey: "Invalid url request"]
      let nsError = NSError(domain: "ahdenglish.com", code: -999, userInfo: dic)
      completion(nil, nsError)
      return
    }
    let task = URLSession.shared.usersResponseModelTask(with: _url,
                                                        completionHandler: { usersResponseModel, _, error in
                                                          completion(usersResponseModel, error)
                                                        })
    task.resume()
  }
}
