import Foundation

public protocol RequestExecutor {
  /// Executes an URLRequest and delivers an async result
  ///
  /// - Parameters:
  ///   - urlRequest: The URLRequest to execute
  ///   - completion: A result type containing eiter the response or an error
  func execute(_ urlRequest: URLRequest, authHandler: ((String) -> Void)?, completion: @escaping (FlatResult<Response>) -> Void)
}
