//
//  UrlCleaning.swift
//  urlCat
//
//  Created by Alex on 8/9/26.
//

import Foundation

extension String{
    func clean(cleanList:[String]) -> String{
        let originalLink = self
        let splitLink = originalLink.split(separator: "?")
        
        //return the exact same url if there was not tracking at all
        if splitLink.count == 1{
            return originalLink
        }
        
        var splitArguments = splitLink[1].split(separator: "&")
        
        //check which arguments (like ?si) are in the cleanList and remove them from the url
        for cleanElement in cleanList {
            for i in 0...(splitArguments.count - 1){
                //not sure why but the index here is sometimes weird, this check fixes it
                if splitArguments.count - 1 < i{
                    continue
                }
                if splitArguments[i] .starts(with: cleanElement) || splitArguments[i].starts(with: "?\(cleanElement)") || splitArguments[i].starts(with: "&\(cleanElement)"){
                    splitArguments.remove(at: i)
                    continue
                }
            }
        }
        
        //check to make sure ? exists if needed
        if !splitArguments.isEmpty && !splitArguments[0].starts(with: "?"){
            splitArguments[0] = "?\(splitArguments[0])"
        }
        
        //combine into one url and return
        var finalLink:String = String(splitLink[0])
        for argument in splitArguments{
            finalLink += argument
        }
        return finalLink
    }
}
