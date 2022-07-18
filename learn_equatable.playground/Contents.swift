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
