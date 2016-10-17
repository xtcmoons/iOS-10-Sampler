//
//  SampleDataSource.swift
//  iOS-10-Sampler
//
//  Created by shf2 on 2016/10/14.
//  Copyright © 2016年 shf2. All rights reserved.
//

import UIKit

struct Sampler {
    let title: String
    let detail: String
    let classPrefix: String

    func controller() -> UIViewController {
        let storyboard = UIStoryboard(name: classPrefix, bundle: nil)
        guard let controller = storyboard.instantiateInitialViewController() else {
            fatalError()
        }
        controller.title = title
        return controller
    }
}

struct SampleDataSource {
    let samples = [
        Sampler(title: "Speech",
                detail: "Speech Recognition demo using Speech Framework. All languages can be selected",
                classPrefix: "SpeechRecognition"),
        Sampler(title: "Looper",
                detail: "Loop playback demo using AVPlayerLooper",
                classPrefix: "Looper"),
        Sampler(title: "Live Photo Capturing",
                detail: "Live Photo Capturing example using AVCapting",
                classPrefix: "LivePhotoCapture"),
        Sampler(title: "Audio Fade-in/out",
                detail: "Audio Fade-in/out demo",
                classPrefix: "AudioFadeInOut"),
    ]
}


