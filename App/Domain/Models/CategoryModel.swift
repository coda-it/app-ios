//
//  CategoryModel.swift
//  app
//
//  Created by Oskar on 19/08/2021.
//

struct CategoryModel: Codable {
    var id: String
    var name: String
    var image: String
}

struct CategoriesEmbedded: Codable {
    var categories: Array<CategoryModel>
}

struct CategoriesResponse: Codable {
    var _embedded: CategoriesEmbedded
}
