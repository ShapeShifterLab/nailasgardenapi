import Foundation
import Vapor
import FluentSQLite

    //Lesson 5: Custom Classes as JSON Data
    //Lesson 7.1: Posting JSON Data Returning a Future
final class Dish: Content {
    var id: Int?
    var title: String
    var description: String
    var course: String
    var price: Double
    var ingredients = [Ingredient]()
    
    init(title: String, description: String, course: String, price: Double) {
        self.title = title
        self.description = description
        self.course = course
        self.price = price
    }
}

    //Lesson 7.1: Posting JSON Data Returning a Future
final class Ingredient: Content {
    var name: String
    var quantity: Double
    
    init(name: String, quantity: Double) {
        self.name = name
        self.quantity = quantity
    }
}

    //Lesson 8.3
struct Customer: Content {
    var name: String
}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    //Lesson 1: Nested Routes
//    router.get("movies") { req in
//        return "Movies"
//    }
    
//    router.get("movies", "action") { req in
//        return "Action Movies"
//    }
    
//    router.get("movies/action/year/1994") { req in
//        return "Action Movies"
//    }
    
    //Lesson 2: Grouping Routes Problem
//    router.get("api/movies/comedy") { req in
//        return "Comedy Movies"
//    }
//
//    router.get("api/movies/romance") { req in
//        return "Romance Movies"
//    }
    
    //Lesson 2: Grouping Routes Solution
//    let moviesGroup = router.grouped("api/movies")
//
//    moviesGroup.get("action") { req in
//        return "Action Movies, Hell Yeah!"
//    }
//
//    moviesGroup.get("comedy") { req in
//        return "Comedy Movies"
//    }
//
//    moviesGroup.get("romance") { req in
//        return "Romance Movies"
//    }
    
    //Lesson 3: Parameters
//    router.get("movies", String.parameter, "year", Int.parameter) { req -> String in
//        let genre = try req.parameters.next(String.self)
//        let year = try req.parameters.next(Int.self)
//        return "Genre is: \(genre) and year is: \(year)"
//    }
    
    //Lesson 4: Querystring
//    router.get("movies") { req -> String in
//        let search = try req.query.get(String.self, at: "search")
//        let page = try req.query.get(Int.self, at: "page")
//        let sort = try req.query.get(String.self, at: "sort")
//        return "search is \(search), page is \(page) and sort is \(sort)"
//    }
    
    
    //Lesson 5: Custom Classes as JSON Data
//    router.get("dish") { req -> Dish in
//        let dish = Dish(title: "Meat balls", description: "This is the description of the meatballs dish", course: "Entrees", price: 8.50)
//        return dish
//    }
//
    
    //Lesson 6: Retuning an Array of JSON Objects
//    router.get("dishes") { req -> [Dish] in
//
//        let dishes = [Dish(title: "Meat balls", description: "This is the description of the meatballs dish", course: "Entrees", price: 8.50), Dish(title: "Chicken Tikka Masala", description: "This is the description of the Chicken Tikka Masala dish", course: "Entrees", price: 12)]
//
//        return dishes
//    }
    
    
    //Lesson 7: Posting JSON Data
//    router.post(Dish.self, at: "api/dish") { req, data -> String in
//        return "hello, world"
//    }
    
    //Lesson 7.1: Posting JSON Data Returning a Future
//    router.post(Dish.self, at: "api/dish") { req, data -> Future<Dish> in
//        return Future.map(on: req, { () -> Dish in
//            data.id = 100
//            return data
//        })
//    }
    
    //Lesson 8.1: Map and FlatMap
    //Blocking the other request while "hello world is being returned
//    router.get("hello") { request in
//        return "hello, world"
//    }
    
    //Lesson 8.2: Map and FlatMap
//    router.get("hello") { request -> Future<String> in
//        //this will be returned immediately
//        return Future.map(on: request, { () -> String in
//            //this will be returned later on
//            return "hello, world"
//        })
//    }
    
    //Lesson 8.3: Map and FlatMap
    router.get("customers") { request -> Future<[Customer]> in
        return getAllCustomers(req: request)
    }
    
    //Lesson 8.3: Map and FlatMap
    func getAllCustomers(req: Request) -> Future<[Customer]> {
        
        return Future.flatMap(on: req) { () -> EventLoopFuture<[Customer]> in
            
            var customers = [Customer(name: "john"), Customer(name: "mary")]
            customers[0].name = "jack"
            
            return Future.map(on: req, { () -> [Customer] in
                
                return customers
            })
        }
    }
    
//    let dishesController = DishesController()
//    try router.register(collection: dishesController)
//
//    router.get("api/dishes", use: dishesController.getAll)
//    router.get("api/dish", Dish.parameter, use: dishesController.getById)
//
//    router.post(Dish.self, at: "api/dish") { request, dish -> Future<Dish> in
//        return dish.save(on: request)
//    }
//
//    //deleting item from dishes
//    router.delete("api/dish", Dish.parameter) { req -> Future<Dish> in
//        try req.parameters.next(Dish.self).delete(on: req)
//
//    }
//
//
//    router.get("api/dishes", String.parameter) { req -> Future<[Dish]> in
//        let course = try req.parameters.next(String.self).lowercased()
//
//        return try Dish.query(on: req)
//            .filter(\.course == course).all()
//    }
//
//    router.get("api/dish", Dish.parameter) { req -> Future<Dish> in
//        return try req.parameters.next(Dish.self)
//    }
//
//
//    router.get("api/dishes") { req -> Future<[Dish]> in
//        return Dish.query(on: req).all()
//
//    }
    
}
