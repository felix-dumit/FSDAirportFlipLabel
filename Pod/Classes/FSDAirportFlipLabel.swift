//
//  AirportFlipLabel.m
//  MyAnimations
//
//  Created by Felix Dumit on 3/25/14.
//  Copyright (c) 2014 Felix Dumit. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

class AirportFlipLabel: UILabel {
    private var labelsInFlip: Int = 2
    
    private var labels = [UILabel]()
    
    var useSound: Bool = true
    var fixedLength: Int = -1
    var numberOfFlips: Int = 10
    var numberOfFlipsRange: CGFloat = 1.0
    var flipDuration: CGFloat = 0.1
    var flipDurationRange: CGFloat = 1.0
    var flipping: Bool {
        return labelsInFlip > 0
    }
    
    typealias CompletionBlock = () -> Void
    
    var startedFlippingLabelsBlock: CompletionBlock!
    var finishedFlippingLabelsBlock: CompletionBlock!

    typealias DashboardSmallCellCallback = () -> Void

    var flipTextColor: UIColor = XplorColor.white
    var flipBackGroundColor: UIColor = XplorColor.black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.baseInit()
    }
    
    func baseInit() {
        self.textColor = XplorColor.clear
    }
    
    func getOrCreateLabelForIndex(_ index: Int, offset: CGFloat) -> UILabel {
        let frame = CGRect(x: self.bounds.origin.x + ((self.font.pointSize + 3) * CGFloat(index)) + offset, y: self.bounds.origin.y, width: self.font.pointSize + 2, height: self.font.pointSize + 2)
        var label: UILabel
        if index < self.labels.count {
            label = self.labels[index]
        } else {
            label = UILabel()
            label.font = self.font
            self.labels.append(label)
            self.addSubview(label)
            label.textColor = self.flipTextColor
            label.textAlignment = .center
        }
        label.frame = frame
        label.backgroundColor = self.flipBackGroundColor
        return label
    }
    
    override public var text: String? {
        didSet {
            self.updateText(text ?? "")
        }
    }

    func updateText(_ text: String) {
        self.resetLabels()
        let len = max(self.fixedLength, text.count)
        for i in 0 ..< len {
            var offset: CGFloat = 0.0
            if i == 0 || i + 1 == len {
                offset = (self.bounds.size.width - ((self.font.pointSize + 5) * CGFloat(len))) / 2
                offset = offset > 0 ? offset : 15.0
            }
            let label = self.getOrCreateLabelForIndex(i, offset: offset)
            var ichar = ""
            if i < text.count {
                ichar = "\(text[text.index(text.startIndex, offsetBy: i)])"
            }
            label.isHidden = ichar == "" && self.fixedLength < 0
            if label.text != ichar {
                self.animateLabel(label, toLetter: ichar)
            }
            
            if self.useSound && labelsInFlip == 1 {
                FlipAudioPlayer.sharedInstance.playFlipSound(rate: 0.1 / self.flipDuration)
            }
        }
    }
    
    func resetLabels() {
        labelsInFlip = 0
        for label: UILabel in self.labels {
            label.isHidden = true
        }
    }
    
    func animateLabel(_ label: UILabel, toLetter letter: String) {
        labelsInFlip += 1
        if letter == " " || letter == "" {
            self.flipLabel(label, toLetter: letter, inNumberOfFlips: 1)
        } else {
            if labelsInFlip == 1 {
                self.startedFlippingLabelsBlock?()
            }
            let extraFlips = Int((CGFloat(arc4random()).truncatingRemainder(dividingBy: (CGFloat(self.numberOfFlips) * self.numberOfFlipsRange))))
            self.flipLabel(label, toLetter: letter, inNumberOfFlips: self.numberOfFlips + extraFlips)
        }
    }
    
    func randomAlphabetCharacter() -> String {
        let alphabet = "0123456789"
        return "\(alphabet[alphabet.index(alphabet.startIndex, offsetBy: (Int(arc4random()) % alphabet.count))])"
    }
    
    func flipLabel(_ label: UILabel, toLetter letter: String, inNumberOfFlips flipsToDo: Int) {
        let duration = self.flipDuration + (CGFloat(drand48()) * self.flipDurationRange * self.flipDuration)
        
        UIView.transition(with: label, duration: TimeInterval(duration), options: .transitionFlipFromTop, animations: { label.text = flipsToDo == 1 ? letter : self.randomAlphabetCharacter() }, completion: { _ in
            if flipsToDo == 1 {
                self.labelsInFlip -= 1
                if self.labelsInFlip <= Int(ceil(0.2 * Double(self.text?.count ?? 0))) && self.useSound {
                    FlipAudioPlayer.sharedInstance.fadeVolume(self.flipDuration * CGFloat(self.labelsInFlip))
                }
                if self.labelsInFlip == 0 {
                    self.finishedFlippingLabelsBlock?()
                    if self.useSound {
                        FlipAudioPlayer.sharedInstance.stopFlipSound()
                    }
                }
            } else {
                self.flipLabel(label, toLetter: letter, inNumberOfFlips: flipsToDo - 1)
            }

        })
    }
}

class FlipAudioPlayer: NSObject {
    private var flipAudioPlayer: AVAudioPlayer!
    
    var labelsPlaying: Int = 0
    var volumeFading: Bool = true
    
    static var sharedInstance = FlipAudioPlayer()
    
    override init() {
        guard let path = Bundle.main.path(forResource: "flipflap", ofType: "aiff") else { return }
        guard let url = URL(string: path) else { return }
        do {
            flipAudioPlayer = try AVAudioPlayer(contentsOf: url)
            flipAudioPlayer.numberOfLoops = -1
        } catch {

        }
    }
    
    func playFlipSound(rate: CGFloat) {
        self.labelsPlaying += 1
        self.volumeFading = false
        if !flipAudioPlayer.isPlaying {
            flipAudioPlayer.rate = Float(rate)
            flipAudioPlayer.volume = 1.0
            flipAudioPlayer.play()
        }
    }
    
    @objc
    func fadeVolume(_ duration: CGFloat) {
        self.labelsPlaying -= 1
        if self.labelsPlaying <= 1 {
            if flipAudioPlayer.volume > 0.0 && !self.volumeFading {
                flipAudioPlayer.volume *= 0.7
                self.volumeFading = true
                self.perform(#selector(fadeVolume), with: (duration), afterDelay: TimeInterval(duration))
            } else {
                self.stopFlipSound()
            }
        }
    }
    
    func stopFlipSound() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(fadeVolume), object: nil)
        flipAudioPlayer.stop()
        flipAudioPlayer.currentTime = 0
        flipAudioPlayer.prepareToPlay()
    }
}
