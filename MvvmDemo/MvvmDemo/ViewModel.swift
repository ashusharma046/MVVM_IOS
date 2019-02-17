//
//  ViewModel.swift
//  SampleObj
//
//  Created by Ashu Sharma 3 on 1/31/19.
//  Copyright © 2019 Ashu Sharma 3. All rights reserved.
//

import UIKit





struct User : Decodable{
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
    init(_ dictionary: [String: Any]) {
        self.userId = dictionary["userId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.completed = dictionary["completed"] as? Bool ?? false
    }
}
class ViewModel {
    
    var webClient = WebClient()
    var model = [User]()
    
    func downnLoadData(requestUrl:NSURL,success:@escaping OnSuccess, failure:@escaping OnFailure) {
        
        webClient.processRequest(requestUrl: requestUrl, success: {
            [weak self] (data) in
            let customParser = CustomParser()
            self?.model = customParser.parseJson(dataResponse: data)
            success(data)
            })
        { (error) in
            failure(error)
        }
    }
}
