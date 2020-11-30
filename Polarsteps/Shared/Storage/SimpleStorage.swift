import Domain
import Foundation
import Entities
import APIClient
import NetworkingCore

final class SimpleStorage: IStorage {
  // MARK: - Private details
  @CodableUserDefault("localUser", defaultValue: nil)
  private var localUser: User?

  @CodableUserDefault("myTrips", defaultValue: [])
  private var myTrips: [Trip]
  
  // MARK: - IStorage
  func getUser() -> User? {
    return self.localUser
  }

  func saveUser(_ user: User) {
    self.localUser = user
  }

  func getMyTrips() -> [Trip] {
    return self.myTrips
  }

  func createTrip(_ trip: Trip) {
    var trips = self.myTrips
    trips.append(trip)
    self.myTrips = trips
  }

  func updateTrip(_ trip: Trip) {
    fatalError("Not implemented")
  }

  func deleteTrip(_ trip: Trip) {
    var trips = self.myTrips
    trips.removeAll(where: { $0.id == trip.id })
    self.myTrips = trips
  }

  func setCookies(_ cookies: [HTTPCookie]) {
    let cookiesStorage = HTTPCookieStorage.shared
    let userDefaults = UserDefaults.standard

    let serverBaseUrl = APIEndpoint<Any>.basePath
    var cookieDict = [String : AnyObject]()

    for cookie in cookiesStorage.cookies(for: NSURL(string: serverBaseUrl)! as URL)! {
      cookieDict[cookie.name] = cookie.properties as AnyObject?
    }
    userDefaults.set(cookieDict, forKey: "cookiesKey")
  }

  func restoreCookies() {
    let cookiesStorage = HTTPCookieStorage.shared
    let userDefaults = UserDefaults.standard

    if let cookieDictionary = userDefaults.dictionary(forKey: "cookiesKey") {

      for (_, cookieProperties) in cookieDictionary {
        if let cookie = HTTPCookie(properties: cookieProperties as! [HTTPCookiePropertyKey : Any] ) {
          cookiesStorage.setCookie(cookie)
        }
      }
    }
  }
}
