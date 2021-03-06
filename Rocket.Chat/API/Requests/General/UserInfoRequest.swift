//
//  UserInfoRequest.swift
//  Rocket.Chat
//
//  Created by Matheus Cardoso on 9/19/17.
//  Copyright © 2017 Rocket.Chat. All rights reserved.
//
//  DOCS: https://rocket.chat/docs/developer-guides/rest-api/users/info

import SwiftyJSON

typealias UserInfoResult = APIResult<UserInfoRequest>

class UserInfoRequest: APIRequest {
    let path = "/api/v1/users.info"

    let query: String?

    let userId: String?
    let username: String?

    init(userId: String) {
        self.userId = userId
        self.username = nil
        self.query = "userId=\(userId)"
    }

    init(username: String) {
        self.username = username
        self.userId = nil
        self.query = "username=\(username)"
    }
}

extension APIResult where T == UserInfoRequest {
    var user: User? {
        guard let raw = raw?["user"] else { return nil }

        let user = User()
        user.map(raw, realm: nil)
        return user
    }
}
