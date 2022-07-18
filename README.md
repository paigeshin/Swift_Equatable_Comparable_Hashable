# Swift_Equatable_Comparable_Hashable

# Equatable

Any type that conforms to the Equatable protocol can be compared for equality using the comparison operator (==) and the inequality operator (!=). By default, some of the Swift Standard Library types like Int and String conform to the Equatable protocol allowing us to compare for equality. We can add Equatable conformance to our own custom types which is particularly useful when looking for particular instances in a collection.

The following conditions are needed for custom types to conform to Equatable:

- For a **struct** all of its stored properties conform to Equatable.
- For an **enum** all of its associated values conform to Equatable.
- For anything else, we implement the equal-to operator (==) as a static method of our type.

```swift
import UIKit

// By default, Strings conform to `Equatable`
let yourName = "Paige"
let myName = "Lily"

if yourName == myName {

}

// struct
struct User: Equatable {
    var id: Int
    var name: String
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

let user1 = User(id: 1, name: "Paige")
let user2 = User(id: 1, name: "hello")

if user1 == user2 {
    print("the users are the same") // This will be printed if all property values are the same
} else {
    print("the users are different")
}

// enum
enum AppTheme { // By default, enum conforms to Equatable
    case darkMode, lightMode
}

let currentTheme = AppTheme.darkMode
let newTheme = AppTheme.lightMode

if currentTheme == newTheme {
    print("Theme is same")
} else {
    print("Theme is different")
}

// class
class UserModel {
    
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}

extension UserModel: Equatable {
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}

let userModel1 = UserModel(id: 1, name: "Paige")
let userModel2 = UserModel(id: 1, name: "Lily")

if userModel1 == userModel2 {
    print("the user models are the same")
} else {
    print("the user models are different")
}

let collectionOfUsers = [userModel1, userModel2]

// to use `.firstIndex(of)`, class must confrom to equatable
let index = collectionOfUsers.firstIndex(of: userModel1)
print(index)

// `.contains` requires the class to conform to equatable
if collectionOfUsers.contains(where: { userModel in
    return userModel == userModel2
}) {
    
}
```

# Comparable

Any type that conforms to **Comparable** can be compared the relational operators (<), (>), (<=) and (>=). It’s useful to make our custom types conform to Comparable if they have some kind of inherent order. 

A type that conforms to Comparable must implement the less-than operator (<) as a static method. The protocol Comparable inherits from Equatable which means any custom type we make Comparable must also implement the equal-to operator (==) as a static method.

```swift
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
```
# Hashable

Any type that conforms to **Hashable** can be used in a **Set** or as a **Dictionary** key. The idea is that a type that is **Hashable** is unique.

A **Set** stores distinct values of the same type in a collection with no defined ordering. It’s a special kind of collection that guarantees that items only appear once but no order is defined. A type must be hashable to be stored in a **Set**. The type of a **Set** is written as Set<Element> where Element stands for a type representing a sequence’s elements

The following conditions are needed for a type to conform to Hashable:

- A struct whose stored properties all conform to Hashable.
- An enum whose associated values all conform to Hashable.
- For any other custom type, implement the **hash(into:)** method in addition to conforming to the protocol Equatable because Hashable inherits from Equatable.

```swift
import UIKit

// Dictionary & Set
let studentScores = ["Paige": 60, "Lily": 50, "Paul": 80]
let students: Set<String> = Set<String>(["Paige", "Paige"])
print(students.count) // 1

// Custom Type
struct Song {
    var id: String
    var artist: String
    var genre: String
}

extension Song: Hashable {

    // == must be implemented to use hash() method
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.id == rhs.id
    }
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

let song1 = Song(id: "1", artist: "Paige", genre: "Action")
let song2 = Song(id: "2", artist: "Sunghee", genre: "Melo")
let song3 = Song(id: "1", artist: "Paige", genre: "Rock")
let musicPlaylist: Set<Song> = Set<Song>([song1, song2, song3])
print(musicPlaylist)
print(musicPlaylist.count)
```
