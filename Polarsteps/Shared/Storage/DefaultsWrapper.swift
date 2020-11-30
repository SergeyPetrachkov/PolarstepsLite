import Foundation

@propertyWrapper
struct CodableUserDefault<T: Codable> {
  let key: String
  let defaultValue: T

  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()

  init(_ key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }

  var wrappedValue: T {
    get {
      if let stored = UserDefaults.standard.data(forKey: key) {
        let decoded = try? self.decoder.decode(T.self, from: stored)
        return decoded ?? defaultValue
      } else {
        return defaultValue
      }
    }
    set {
      let encodedData = try? self.encoder.encode(newValue)
      UserDefaults.standard.set(encodedData, forKey: key)
    }
  }
}
