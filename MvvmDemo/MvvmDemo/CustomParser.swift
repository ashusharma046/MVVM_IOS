//
//  CustomParser.swift
//  SampleObj
//
//  Created by Ashu Sharma 3 on 1/31/19.
//  Copyright © 2019 Ashu Sharma 3. All rights reserved.
//

import UIKit

class CustomParser {
    
    
    
    
    
 func parseJson(dataResponse:Data) -> [User] {
        
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode([User].self, from:
                dataResponse as Data)
            return model
        } catch let parsingError {
            print("Error", parsingError)
        }
        return [User]()
    }
}
