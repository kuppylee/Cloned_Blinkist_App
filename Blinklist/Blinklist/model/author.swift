//
//  author.swift
//  Blinklist
//
//  Created by Decagon on 27/07/2021.
//
//"id": 1,
//"title": "Elon Musk",
//"author": "Ashlee Vance",
//"book_type": "audiobook",
//"length": 144,
//"image": "5112YFsXIJL._SX330_BO1,204,203,200_",
//"description": "Elon Musk is the the biography of an icon named Elon Musk",
//"access": "free"
import Foundation

struct Author : Codable {
    var id : Int
    var title : String
    var author : String
    var book_type : String
    var length : Int
    var image : String
    var description : String
    var access : String
}
