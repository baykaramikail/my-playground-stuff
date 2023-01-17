import Foundation
import UIKit

enum error: Error{
    case short, long
}

func throwErr(name: String)throws -> String{
    if (name.count < 8){
        throw error.short
    }else if (name.count > 16){
        throw error.long
    }
    
    return "passed name is \(name)"
}


do{
    let result = try throwErr(name: "hola")
    print(result)
}catch error.short{
    print("passed name was too short")
}catch {
    print("passed name was too long")
}




