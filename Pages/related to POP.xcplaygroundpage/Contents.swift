import Foundation



protocol groceryItem{
    func cost() -> Float
    var name: String {get set}
}


struct lemon: groceryItem{
    var name = "Lemon"
    var pricePerKg: Float
    var kg: Float
    func cost() -> Float{
        return kg * pricePerKg
    }
}


struct toothBrush: groceryItem{
    var name = "Toothbrush"
    var price: Float
    func cost() -> Float {
        return price
    }
}


struct GroceryStore{
    let name: String
    func fisYazdır(for customer: Customer) -> Float{
        var total: Float = 0
        customer.shopList.forEach { item in
            total += item.cost()
            print("item: \(item.name), price: \(item.cost()) ")
        }
        
        var x = total
        x = Float(Double(floor(100*x)/100))
        return x
    }
}


struct Customer{
    let name: String
    var shopList: [groceryItem]
    
    func goToGroceryStore(store: GroceryStore){
        print("total money to pay is: \(store.fisYazdır(for: self))")
    }
}



var customer = Customer(name: "mikail", shopList: [lemon(pricePerKg: 12.47, kg: 2.5), toothBrush(price: 60)])
var bim = GroceryStore(name: "bim")


customer.goToGroceryStore(store: bim)


//  PRINTS
//    item: Lemon, price: 31.175001
//    item: Toothbrush, price: 60.0
//    total money to pay is: 91.17
