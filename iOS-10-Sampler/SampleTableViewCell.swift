//
//  SampleTableViewCell.swift
//  iOS-10-Sampler
//
//  Created by shf2 on 2016/10/14.
//  Copyright © 2016年 shf2. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func showSample(sample: Sampler) {
        titleLabel.text = sample.title
        detailLabel.text = sample.detail
    }

}
