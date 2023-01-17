import Foundation

/*
struct Person: Codable{
    var placeinarray: Int?
    var name: String
    var surname: String
}

var people = [Person]()

let data = """
[
    {
        "name": "a",
        "surname": "b"
    },
    {
        "name": "c",
        "surname": "d"
    },
    {
        "name": "e",
        "surname": "f"
    }
]
""".data(using: .utf8)

let decoder = JSONDecoder()
do{
    if let data = data{
        let personArray = try decoder.decode([Person].self, from: data)
        people = personArray
    }
}catch{
    print(error)
}

people.forEach({ person in
   print( person.name)
})

*/


struct GameData: Codable{
    let results: [Results]
    
}

struct Results: Codable{
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Double
}

var games = [Results]()

func getGames(){
    let baseUrl = "https://api.rawg.io/api/games?key="
    let key = "d578fc59bae14c89908b8541b5014ee8"
    let urlString = "\(baseUrl)\(key)"
    
    if let url = URL(string: urlString){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                print("Unable to complete your request. Please check your internet connection")
                return
            }
            
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(GameData.self, from: data)
                    games = decodedData.results
                    print(games)
                }catch{
                    print("The data received from the server was invalid. Please try again.")

                }
            }
        }
        task.resume()
    }
}

getGames()


