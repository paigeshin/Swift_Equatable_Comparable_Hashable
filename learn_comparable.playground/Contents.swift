import UIKit

struct User {
    var id: Int
    var name: String
    var registrationDate: Date
}

extension User: Comparable {
    
    static func <(lhs: User, rhs: User) -> Bool {
        return lhs.registrationDate < rhs.registrationDate
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.registrationDate == rhs.registrationDate
    }
    
}

let user1 = User(id: 1, name: "Paige", registrationDate: Date.init(timeIntervalSinceNow: 5))
let user2 = User(id: 2, name: "Paige", registrationDate: Date.init(timeIntervalSinceNow: 1))

if user1 < user2 {
    print("\(user1.name) registered before \(user2.name)")
} else {
    print("\(user2.name) registered before \(user1.name)")
}

var users = [user1, user2]

// If your data model confroms to Comparable, you can use some collection methods
users.sort()
let newUsers = users.sorted()
