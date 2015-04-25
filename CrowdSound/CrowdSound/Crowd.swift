//
//  Crowd.swift
//  CrowdSound
//
//  Created by Terin Patel-Wilson on 3/6/15.
//  Copyright (c) 2015 cs439. All rights reserved.
//

import Foundation

// protocol to use when playlist grows in playlistTableViewController.
protocol updateTracklistObserver{
    // function call?
    func updatePlayerTracklist()
}

class Crowd {
    var name : String       // crowd name
    var playlistDelegate:updateTracklistObserver? = nil
    var playlist : Playlist
//        {
//        didSet{
//            // update player when playlist changed.
//            println("=====================DELEGATE GOT CALLED=====================")
//            if let delegate = self.playlistDelegate {
//                delegate.updatePlayerTracklist()
//            }
//        }
//    }// playlist songs
    var pending : Playlist  // pending songs
    var host : String       // host id
    var threshold : Int     // threshold to be upvoted
    var guests : [String]   // list of guests invited
//    var player : SPTAudioStreamingController
    var currentTrackIndex : Int
    var isPrivate: Bool     // if need password
    var password: String    // what the password is
    
    init() {
        name = ""
        playlist = Playlist()
//        playlist.songs = []{
//            didSet{
//                // update player when playlist changed.
//                println("=====================DELEGATE GOT CALLED=====================")
//                if let delegate = self.playlistDelegate {
//                    delegate.updatePlayerTracklist()
//                }
//            }
//        }// playlist songs
        
        pending = Playlist()
        host = ""
        threshold = 0
        guests = []
        currentTrackIndex = -1
        isPrivate = false
        password = ""
    }
    
    // for testing - create default crowd 
    class func defaultCrowd() -> Crowd {
        var crowd = Crowd()
        crowd.name = "Default Crowd"
        crowd.playlist = Playlist.defaultPlaylist()
        crowd.pending = Playlist.defaultPending()
        crowd.host = "Default Host"
        crowd.threshold = 7
        crowd.guests = ["Jack", "Jared", "Terin", "Eli", "TIM"]
        crowd.currentTrackIndex = 0
        return crowd
    }
    
    func upvotePendingSong(songIndex:Int) {
        pending.upvoteSong(songIndex)
        if (pending.top().upvotes >= threshold) {
            playlist.addSong(pending.pop())
//            NSNotificationCenter.defaultCenter().postNotificationName("newSongInPlaylist", object: nil)
        }
    }
    func downvotePendingSong(songIndex:Int) {
        pending.downvoteSong(songIndex)
    }
}