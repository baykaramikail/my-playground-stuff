
import Foundation

protocol HumanFunctions{
    func walk()
    func swim() -> String
    
}

enum Gender{
    case male, female
}


class Human: HumanFunctions{
    
    var name: String
    var age: Int
    var canSwim: Bool
    
    func walk() {
        print("humans can walk")
    }
    
    func swim() -> String {
        if self.canSwim{
            return "This human can swim"
        }else{
            return "This human can not swim"
        }
    }
    
    init(name: String, age: Int, canSwim: Bool){
        self.name = name
        self.age = age
        self.canSwim = canSwim
    }
}

class MaleHuman: Human {
    
    let gender = Gender.male
    
    override func swim() -> String {
        super.swim()
    }
    
    override func walk(){
        print("male humans such as me \(self.name) can walk also")
    }
    
       override init(name: String, age: Int, canSwim: Bool) {
       super.init(name: name, age: age, canSwim: canSwim)
   }
}

let mikail = Human(name: "mikail", age: 23, canSwim: true)

let nebi = MaleHuman(name: "nebi", age: 21, canSwim: false)


print(nebi.gender)
mikail.walk()
nebi.walk()

print(nebi.swim())
