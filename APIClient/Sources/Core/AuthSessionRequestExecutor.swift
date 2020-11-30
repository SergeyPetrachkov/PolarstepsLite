//
//  File.swift
//  
//
//  Created by sergey on 30.11.2020.
//

import Foundation

//public struct SessionCookieResponse: Codable {
//  public let cookie: String
//
//  public init(cookie: String) {
//    self.cookie = cookie
//  }
//}
//
//public struct AuthorizedContainer: Codable {
//  public let sessionData: SessionCookieResponse?
//  public let data: Data
//}

//public final class SessionInitializerRequestExecutor: RequestExecutor {
//  private let urlSession: URLSession
//
//  public init(urlSession: URLSession) {
//    self.urlSession = urlSession
//  }
//
//  // MARK: - RequestExecutor
//  public func execute(_ urlRequest: URLRequest, completion: @escaping (FlatResult<Response>) -> Void) {
//    self.urlSession.dataTask(with: urlRequest) { data, response, error in
//      completion(mapSessionInit(data: data, urlResponse: response, error: error))
//    }.resume()
//  }
//
//  func retrieve(_ url: URL, completion: @escaping (FlatResult<Response>) -> Void) {}
//}
//
//private func mapSessionInit(data: Data?, urlResponse: URLResponse?, error: Error?) -> FlatResult<Response> {
//  if let error = error {
//    return .failure(error)
//  }
//  else {
//    guard let httpUrlResponse = urlResponse as? HTTPURLResponse,
//          let data = data else {
//      return .failure(APIError.unknownResponseType)
//    }
//    if let rememberToken = httpUrlResponse.allHeaderFields["Set-Cookie"] as? String {
//
//      let response = SessionCookieResponse(cookie: rememberToken)
//      let container = AuthorizedContainer.init(sessionData: response, data: data)
//      let encodedResponse = try? JSONEncoder().encode(container)
//      return .success(.init(statusCode: httpUrlResponse.statusCode, data: encodedResponse))
//    }
//    else {
//      switch httpUrlResponse.statusCode {
//      case 200:
//        return .success(.init(statusCode: httpUrlResponse.statusCode, data: data))
//      default:
//        return .failure(APIError.unknownResponseType)
//      }
//    }
//  }
//}
