//
//  NetworkProtocols.swift
//  Retain
//
//  Created by roei baruch on 02/04/2019.
//  Copyright © 2019 roei baruch. All rights reserved.
//

import Foundation

protocol NetworkProtocols {
    func call(success: @escaping () -> Void, failure: @escaping (String) -> Void)
}
