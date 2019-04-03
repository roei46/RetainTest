//
//  DependencyInjector.swift
//  Retain
//
//  Created by roei baruch on 02/04/2019.
//  Copyright © 2019 roei baruch. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard


class DependencyInjector: NSObject {
    let container: Container
    
    override init() {
        container = Container()
        super.init()
        register()
    }
}


extension DependencyInjector {
    
    func register() {
                container.register(NetworkProtocols.self) { _ in CameraManager() }.inObjectScope(.container)
        
                container.register(CameraProtocol.self) { _ in CameraCgiApi() }.inObjectScope(.container)
        
                container.register(CameraManager.self) { r in
                    let api = CameraManager()
                    api.cameraProtocols = r.resolve(CameraProtocol.self)!
                    return api
                }
                container.storyboardInitCompleted(SplashViewController.self) {r,c in
                    c.network = r.resolve(CameraManager.self)
                }

                container.storyboardInitCompleted(SecondViewController.self) {r,c in
                    c.network = r.resolve(CameraManager.self)
                }
        
    }
}
