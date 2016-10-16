//
//  WebsiteBlock.swift
//  Blockspot
//
//  Created by Zubair Chowdhury on 16/10/2016.
//  Copyright © 2016 Alessandro Bonardi. All rights reserved.
//

import Foundation

class WebsiteBlock {

    var BlockedWebsites: [String]
    
    init (list : [String]) {
        BlockedWebsites = list
    }
    
    func generateStrings() -> [String] {
        let ip = "127.0.0.1"
        return BlockedWebsites.map({
            (website: String) -> String in
            "\(ip)       \(website)"
        })
    }
    
    func executeCommand(command: String, args: [String]) -> Void {
        let task = Process()
        
        task.launchPath = command
        task.arguments = args
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
    }
    
    func addNewLines (sentences : [String]) -> String {
        return sentences.map({s in s.appending("\n")}).joined()
    }
    
    // EXECUTE A BASH SCRIPT FROM SWIFT!!
    // THE GOAL IS TO EXECUTE A SCRIPT
    // WHICH COPIES THE HOST FILE TO OUR DIRECTORY
    // APPENDS THE GENERATED STRINGS
    // THEN COPIES THE FILE BACK TO THE /private/etc/hosts
    
    func rewriteHostFile() {
        let hostFileContents = addNewLines(sentences: generateStrings())
        var command = "cd ~/test_stuff && sh"
        var args = ["script"]
        executeCommand(command: command, args: args)
        command = "echo \(hostFileContents) >>"
        args = ["hosts"]
    }
    

}
