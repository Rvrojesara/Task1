//
//  ApiManager.swift
//  Task1
//
//  Created by admin on 03/10/24.
//

import Foundation
import Alamofire

class ApiManager{
    let urlstr="https://official-joke-api.appspot.com/jokes/random/25"
    
    func fetchJokes(completionHandler: @escaping(Result<[jokemodel], Error>)->Void){
        AF.request(urlstr).responseDecodable(of: [jokemodel].self){
            response in
            switch response.result{
                
            case.success(let data):
                completionHandler(.success(data))
                
            case.failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
