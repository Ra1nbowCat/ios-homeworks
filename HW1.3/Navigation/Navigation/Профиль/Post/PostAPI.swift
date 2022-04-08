//
//  PostAPI.swift
//  Navigation
//
//  Created by Илья Лехов on 21.03.2022.
//

import Foundation

class PostAPI {
    var counter: Int? = 0
   var posts = [
    Post(author: nil, description: nil, image: nil, likes: nil, views: nil),
    Post(author: "Memolog123", description: "Lol, cringe", image: "first", likes: 123, views: 321),
     Post(author: "MemKing", description: "LMAO", image: "second", likes: 421, views: 432),
     Post(author: "MemessS", description: "Good meme?", image: "third", likes: 352, views: 523),
     Post(author: "MemoedxD", description: "True!", image: "fourth", likes: 321, views: 712),
    ]
}
