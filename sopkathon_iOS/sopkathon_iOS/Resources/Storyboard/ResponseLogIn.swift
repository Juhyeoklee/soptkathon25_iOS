//
//  ResponseLogIn.swift
//  sopkathon_iOS
//
//  Created by 이주혁 on 2019/11/06.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation


// Mark: - ResponseLogIn
// 성공했을 때 response body
struct ResponseLogIn {
    let success: Bool
    let message: String
    let data: DataClass?
}
struct DataClass {
    let userID: String
}

struct UserData{
    let user: String
    let candyCount: Int
}
