//
//  WebClient.swift
//  SampleObj
//
//  Created by Ashu Sharma 3 on 1/31/19.
//  Copyright © 2019 Ashu Sharma 3. All rights reserved.
//

import UIKit

public typealias OnSuccess = (_ responseObject:Data) -> Void
public typealias BBBYSuccessBool = (Bool) -> Void
public typealias BBBYSuccessURL = (_ downloadedURL:URL) -> Void
public typealias OnFailure = (_ error:NSError) -> Void
public typealias BBBYErrorWithStatus = (_ status: Bool, _ error: NSError?) -> Void

class WebClient {
    
    public func processRequest(requestUrl:NSURL,success:@escaping OnSuccess, failure:@escaping OnFailure) {
        URLSession.shared.dataTask(with: requestUrl as URL) {
            (data, response, error) in
            if error == nil {
                if response != nil {
                    success(data!)
                }
            }
            else {
                if let errorObject = error {
                    failure(errorObject as NSError)
                }
            }
            }.resume()
    }
    
}
