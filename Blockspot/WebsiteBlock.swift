//
//  WebsiteBlock.swift
//  Blockspot
//
//  Created by Zubair Chowdhury on 16/10/2016.
//  Copyright © 2016 Alessandro Bonardi. All rights reserved.
//

import Foundation

class WebsiteBlock {

    private let BlockedWebsites: [String]
 
    init (list : [String]) {
        BlockedWebsites = list
    }
    
    public func rewriteHostFile() {
        let hostFileContents = addNewLines(sentences: generateStrings())
        let command = "cd ~/test_stuff && sh script && echo \(hostFileContents) >> hosts && sh script1"
        executeCommand(command: "/bin/bash", args: [command])
    }
    
    private func addNewLines (sentences : [String]) -> String {
        return sentences.map({s in s.appending("\n")}).joined()
    }
    
    private func generateStrings() -> [String] {
        let ip = "127.0.0.1"
        return BlockedWebsites.map({ website in "\(ip)       \(website)"})
    }
    
    private func executeCommand(command: String, args: [String]){
        let task = Process()
        task.launchPath = command
        task.arguments = args
        task.standardOutput = Pipe()
        task.launch()
        task.waitUntilExit()
    }

}
