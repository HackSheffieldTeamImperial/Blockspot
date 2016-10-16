#!/usr/bin/swift

import Foundation
//run bash in swift
func shell(args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

shell(args: "ls")
shell(args: "cp", "/private/etc/hosts", "/Users/admin_/Documents/Sheffield/Blockspot/sscript")
shell(args: "pwd")

//file I/O
let file = "blacklist.txt" //this is the file. we will write to and read from it

let text = "some text" //just a text

if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    
    let path = dir.appendingPathComponent(file)
    
    //writing
    do {
        try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
    }
    catch {/* error handling here */}
    
    //reading
    do {
        let contents = try String(contentsOf: path, encoding: String.Encoding.utf8)
        print(contents)
    }
    catch {/* error handling here */}
}
