#!/usr/bin/swift

import Foundation

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

let host = "##\n # Host Database\n#\n# localhost is used to configure the loopback interface\n# when the system is booting.  Do not change this entry.\n##\n127.0.0.1       localhost\n255.255.255.255 broadcasthost\n::1             localhost\n"

let listOfHosts: WebsiteBlock = WebsiteBlock(list: ["www.twitter.com", "www.instagram.com"])

let text = listOfHosts.hostFileInput()

let path = "/Users/sarahbaka/Desktop/Blockspot/Blockspot"

do {
    let newHost = host + text
    let hosts_path = "/Users/sarahbaka/Desktop/Blockspot/Blockspot/hosts"
    try newHost.write(toFile: hosts_path, atomically: true, encoding:String.Encoding.utf8)
}

shell(args: "pwd")
//echo 'password' | sudo -S command
shell(args: "sudo", "cp", "/Users/sarahbaka/Desktop/Blockspot/Blockspot/hosts", "/private/etc")

/*
 //file I/O
 let file = "blacklist.txt" //this is the file. we will write to and read from it
 
 if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
 
 let path = dir.appendingPathComponent(file)
 
 //reading
 do {
 let contents = try String(contentsOf: path, encoding: String.Encoding.utf8)
 print(contents)
 }
 catch {/* error handling here */}
 
 //writing
 do {
 
 try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
 }
 catch {/* error handling here */}
 
 }
 */
