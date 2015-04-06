//
//  PlaylistTests.swift
//  CrowdSound
//
//  Created by Jared Katzman on 4/1/15.
//  Copyright (c) 2015 cs439. All rights reserved.
//

import UIKit
import XCTest

class PlaylistTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPendingUpvote() {
        let index = 3
        let playlist = Playlist.defaultPlaylist()
        let songVotes = playlist.songs[index].upvotes
        playlist.upvoteSong(index)
        XCTAssert(songVotes == playlist.songs[index].upvotes + 1, "increased song \(index) upvotes by 1")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testPlaylistPop() {
        let playlist = Playlist.defaultPlaylist()
        let pendingSong = playlist.songs[0]
        let nextSong = playlist.songs[1]
        XCTAssert(pendingSong === playlist.pop(), "pop returned correct song")
        XCTAssert(nextSong === playlist.top(), "pop removed the correct song")
        
    }

}
