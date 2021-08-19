//
//  CategoryUsecases.swift
//  app
//
//  Created by Oskar on 19/08/2021.
//

struct CategoryUsecases {
    let categoryRepository: CategoryRepository
    
    func getAllCategories(apiAddress: String, completion: @escaping (Array<CategoryModel>) -> ()) {
        self.categoryRepository.fetchCategories(apiAddress: apiAddress, completion: completion)
    }
}
