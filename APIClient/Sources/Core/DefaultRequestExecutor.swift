import Foundation

public final class DefaultRequestExecutor: RequestExecutor {

  private let urlSession: URLSession

  public init(session: URLSession) {
    self.urlSession = session
  }

  // MARK: - RequestExecutor
  public func execute(_ urlRequest: URLRequest, authHandler: ((String) -> Void)?, completion: @escaping (FlatResult<Response>) -> Void) {
    self.urlSession.dataTask(with: urlRequest) { data, response, error in
      completion(Networking.mapResponse(data: data, urlResponse: response, error: error, authHandler: authHandler))
    }.resume()
  }

  public func retrieve(_ url: URL, completion: @escaping (FlatResult<Response>) -> Void) {
    self.urlSession.dataTask(with: url) { data, response, error in
      completion(Networking.mapResponse(data: data, urlResponse: response, error: error, authHandler: nil))
    }.resume()
  }
}
