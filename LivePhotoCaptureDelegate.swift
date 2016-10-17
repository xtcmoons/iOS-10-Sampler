//
//  LivePhotoCaptureDelegate.swift
//  iOS-10-Sampler
//
//  Created by shf2 on 2016/10/17.
//  Copyright © 2016年 shf2. All rights reserved.
//

import UIKit
import Photos

class LivePhotoCaptureDelegate: NSObject, AVCapturePhotoCaptureDelegate {

    private(set) var requestedPhotoSettings: AVCapturePhotoSettings
    private let capturingLivePhoto: (Bool) -> ()
    private let completed: (LivePhotoCaptureDelegate) -> ()
    private let photoData: Data? = nil
    private let livePhotoCompanionMovieURL: URL? = nil

    init(with requestedPhotoSettings: AVCapturePhotoSettings, capturingLivePhoto: @escaping (Bool) -> (), completed: @escaping (LivePhotoCaptureDelegate) -> ()) {

        self.requestedPhotoSettings = requestedPhotoSettings
        self.capturingLivePhoto = capturingLivePhoto
        self.completed = completed
    }

    private func save(photoData: Data) {
        PHPhotoLibrary.shared().performChanges({ 
            [unowned self] in
            let creationRequest = PHAssetCreationRequest.forAsset()
            creationRequest.addResource(with: .photo, data: photoData, options: nil)
            })
        
    }
}

