//
//  DatabaseConstants.swift
//  SQLiteDemo
//
//  Created by Thuy Nguyen on 26/05/2021.
//

import Foundation
import SQLite
let db = try! Connection()

let students = Table("students")

let myId = Expression<Int64>("id")
let name = Expression<String>("name")

