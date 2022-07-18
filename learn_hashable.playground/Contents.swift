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
