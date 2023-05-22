import Foundation

/*
class Person {
    var name: String
    weak var pet: Cat?
    
    init(name: String){
        self.name = name
    }
    
    deinit{
        print("person named \(name) deleted")
    }
}

class Cat {
    var name: String
    weak var owner: Person?
    
    init(name: String){
        self.name = name
    }
    deinit{
        print("cat named \(name) deleted")
    }
}


var person: Person? = Person(name: "mikail")
var cat: Cat? = Cat(name: "hellcat")

person?.pet = cat
cat?.owner = person

person = nil
cat = nil

*/

enum CarTypes{
    case daily, offroad
}

class Person {
    var name: String
    weak var car: Car?
    
    init(name: String){
        self.name = name
    }
    
    deinit{
        print("\(name) removed")
    }
}


class Car {
    var name:String
    var type: CarTypes
    weak var owner: Person?
    
    init(name: String,type: CarTypes, owner: Person){
        self.name = name
        self.type = type
        self.owner = owner
    }
    deinit{
        print("car \(name) removed")
    }
}

var mikail: Person? = Person(name: "mikail")
var navara: Car? = Car(name:"Navara", type: .offroad, owner: mikail!)

mikail?.car = navara
navara = nil

