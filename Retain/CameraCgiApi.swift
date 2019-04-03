//
//  CameraCgiApi.swift
//  Retain
//
//  Created by roei baruch on 02/04/2019.
//  Copyright © 2019 roei baruch. All rights reserved.
//

import Foundation
import Alamofire

class CameraCgiApi: CameraProtocol {
    func call(success: @escaping () -> Void, failure: @escaping (String) -> Void) {
        Alamofire.request("https://httpbin.org/get", method: .post).responseString { (responseObject) in
            if responseObject.result.isSuccess {
                print("success")
                success()
            }
            
            if responseObject.result.isFailure {
                print("failed")
                if let error = responseObject.result.error?.localizedDescription {
                failure(error)
                } else {
                    failure("error")
                }
            }
        }
    }
}
