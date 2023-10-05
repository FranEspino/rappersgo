//
//  RappersModel.swift
//  Rappers90
//
//  Created by vespro on 18/06/23.
//

import Foundation


struct Rappers:Codable{
    var rappers: [Rapper]
}

struct Rapper:Codable,Hashable {
    var name: String
    var img: String
    var description: String
    var song: String
    var id: String
}



