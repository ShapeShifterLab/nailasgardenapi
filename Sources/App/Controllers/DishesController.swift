//
//  DishesController.swift
//  App
//
//  Created by Matthew Garrison on 7/1/18.
//

import Foundation
import Vapor
import FluentSQLite

class DishesController: RouteCollection {
    
    //Lesson 10 Controllers - http://localhost:8080/api/dishes
    func getAll(req: Request) -> Future<[Dish]> {
        return Dish.query(on: req).all()
    }
    //Lesson 10.1 Controllers - http://localhost:8080/api/dish/3
    func getById(req: Request) throws -> Future<Dish> {
        return try req.parameters.next(Dish.self)
    }
    //Lesson 10.2
    func boot(router: Router) throws {
        //Lesson 10.3 Moved From routes.swift
//        router.get("api/dishes", use: getAll)
//        router.get("api/dish", Dish.parameter, use: getById)
        
        //Lesson 11
        let dishesRoutes = router.grouped("api/dishes")
        dishesRoutes.get("/", use: getAll)
        dishesRoutes.get(Dish.parameter, use: getById)
        dishesRoutes.post(Dish.self, at: "/", use: createDish)
        dishesRoutes.get("courses", String.parameter, use: getByCourse)
        
    }
    
    func createDish(req: Request, dish: Dish) -> Future<Dish> {
        return dish.save(on: req)
    }
    
    func getByCourse(req: Request) throws -> Future<[Dish]> {
        let course = try req.parameters.next(String.self)
        
        return try Dish.query(on: req)
                    .filter(\.course == course).all()
    }
    
}
