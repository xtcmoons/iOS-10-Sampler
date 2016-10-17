//
//  Looper.swift
//  iOS-10-Sampler
//
//  Created by shf2 on 2016/10/17.
//  Copyright © 2016年 shf2. All rights reserved.
//

import AVFoundation

class Looper: NSObject {

    private var playerItem: AVPlayerItem!
    private let player = AVQueuePlayer()
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper!

    required init(videoURL: URL) {
        super.init()

        playerLayer.player = player
        playerItem = AVPlayerItem(url: videoURL)
    }

    func start(in parentLayer: CALayer) {
        start(in: parentLayer, startRate: 0, endRate: 1)
    }

    @discardableResult func start(in parentLayer: CALayer, startRate: Double, endRate: Double) -> Bool {

        guard startRate >= 0.0 && endRate >= 0.0 && startRate <= 1.0 && endRate <= 1.0 else {
            return false
        }

        let duration = playerItem.asset.duration
        let start = CMTime(seconds: duration.seconds * startRate, preferredTimescale: duration.timescale)
        let end = CMTime(seconds: duration.seconds * endRate, preferredTimescale: duration.timescale)
        let timeRange = CMTimeRange(start: start, end: end)
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem, timeRange: timeRange)
        let videoTracks = playerItem.asset.tracks(withMediaType: AVMediaTypeVideo)
        guard let videoSize = videoTracks.first?.naturalSize else {
            fatalError()
        }
        parentLayer.addSublayer(playerLayer)
        parentLayer.frame.size = videoSize
        playerLayer.position = CGPoint(x: parentLayer.frame.midX, y: parentLayer.frame.midY)
        player.play()

        return true
    }


    func stop() {
        player.pause()
        if let playerLooper = playerLooper {
            playerLooper.disableLooping()
        }
        playerLooper = nil
        playerLayer.removeFromSuperlayer()
    }
}
