import Domain
import Foundation

final class SimpleStorage: IStorage {
  // MARK: - Private details
  @UserDefault("localUser", defaultValue: nil)
  private var localUser: User?

  @UserDefault("myTrips", defaultValue: [])
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
}
