//
//  urlCatTests.swift
//  urlCatTests
//
//  Created by Alex on 7/9/26.
//

import Testing
@testable import urlCat

struct urlCatTests {

    @Test func simpleYoutubeLink() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        // Swift Testing Documentation
        // https://developer.apple.com/documentation/testing
        let argumentsToRemove:[String] = ["si"]
        let link:String = "https://youtu.be/E4WlUXrJgy4?si=bSdlq66xHdifdeIe"
        var cleanLink = await link.clean(cleanList: argumentsToRemove)
        #expect(cleanLink == "https://youtu.be/E4WlUXrJgy4")
    }
    
    @Test func twoTrackers() async throws {
        let argumentsToRemove:[String] = ["stkn", "utm_source"]
        let link:String = "https://www.instagram.com/reel/DXNsmEXjWdk/?utm_source=ig_web_copy_link&stkn=NTc4MTIwNjQ2YQ=="
        var cleanLink = await link.clean(cleanList: argumentsToRemove)
        #expect(cleanLink == "https://www.instagram.com/reel/DXNsmEXjWdk/")
    }
    
    @Test func twoTrackersButLeaveOne() async throws {
        let argumentsToRemove:[String] = ["utm_source"]
        let link:String = "https://www.instagram.com/reel/DXNsmEXjWdk/?utm_source=ig_web_copy_link&stkn=NTc4MTIwNjQ2YQ=="
        var cleanLink = await link.clean(cleanList: argumentsToRemove)
        #expect(cleanLink == "https://www.instagram.com/reel/DXNsmEXjWdk/?stkn=NTc4MTIwNjQ2YQ==")
    }
}
