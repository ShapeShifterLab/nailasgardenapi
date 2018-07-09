//
//  DishesController.swift
//  App
//
//  Created by Matthew Garrison on 7/1/18.
//

import Foundation
import Vapor
import FluentSQLite

//class DishesController: RouteCollection {
//    
//    func boot(router: Router) throws {
//        
//        let dishesRoutes = router.grouped("api/dishes")
//        dishesRoutes.get("/", use: getAll)
//        dishesRoutes.get(Dish.parameter, use: getById)
//        
////        router.get("api/dishes", use: getAll)
////        router.get("api/dish", Dish.parameter, use: getById)
//    }
//    
//    func getAll(req: Request) -> Future<[Dish]> {
//        return Dish.query(on: req).all()
//    }
//    
//    func getById(req: Request) throws -> Future<Dish> {
//        return try req.parameters.next(Dish.self)
//    }
//    
//    
//}
