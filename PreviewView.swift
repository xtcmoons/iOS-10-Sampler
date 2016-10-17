//
//  PreviewView.swift
//  iOS-10-Sampler
//
//  Created by shf2 on 2016/10/17.
//  Copyright © 2016年 shf2. All rights reserved.
//

import UIKit
import AVFoundation

class PreviewView: UIView {

    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }

    var session: AVCaptureSession? {
        get {
            return videoPreviewLayer.session
        }

        set {
            return videoPreviewLayer.session = newValue
        }
    }


    //MARK: UIView
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
