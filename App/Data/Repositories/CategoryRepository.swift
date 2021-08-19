//
//  CategoryRepository.swift
//  app
//
//  Created by Oskar on 19/08/2021.
//

struct CategoryRepository {
    let api: Api
    
    func fetchCategories(apiAddress: String, completion: @escaping (Array<CategoryModel>) -> ()) {
        self.api.get(url: "\(apiAddress)/api/category", type: CategoriesResponse.self,
                     completion: { (data: CategoriesResponse?) in
                        completion(data?._embedded.categories ?? [])
                     })
    }
}
