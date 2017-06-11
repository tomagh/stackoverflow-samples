//
//  ViewController.swift
//  stackoverflow-44288116
//
//  Created by Andrew Tomenko on 6/11/17.
//  Copyright © 2017 toma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	var player = AVPlayer()
	let sView = UIView()

	override func viewDidLoad() {
		super.viewDidLoad()

		// Add AVPlayer
		let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
		player = AVPlayer(url: videoURL!)
		let playerLayer = AVPlayerLayer(player: player)
		playerLayer.frame = self.view.bounds
		self.view.layer.addSublayer(playerLayer)
		player.play()
		
		// Add gestures view
		sView.frame = self.view.frame
		self.view.addSubview(sView)
		self.view.bringSubview(toFront: sView)
		
		// Add gestures
		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeRight.direction = UISwipeGestureRecognizerDirection.right
		sView.addGestureRecognizer(swipeRight)
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeLeft.direction = UISwipeGestureRecognizerDirection.left
		sView.addGestureRecognizer(swipeLeft)
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeUp.direction = UISwipeGestureRecognizerDirection.up
		sView.addGestureRecognizer(swipeUp)
		
		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeDown.direction = UISwipeGestureRecognizerDirection.down
		sView.addGestureRecognizer(swipeDown)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func respondToSwipeGesture(gesture: UIGestureRecognizer) {
		
		if let swipeGesture = gesture as? UISwipeGestureRecognizer {
			switch swipeGesture.direction {
			case UISwipeGestureRecognizerDirection.right:
				print("Swiped right")
				var currentTime = self.player.currentTime();
				currentTime.value -= 15;
				player.seek(to: currentTime)
			case UISwipeGestureRecognizerDirection.down:
				print("Swiped down")
			case UISwipeGestureRecognizerDirection.left:
				print("Swiped left")
				var currentTime = self.player.currentTime();
				currentTime.value += 15;
				player.seek(to: currentTime)
			case UISwipeGestureRecognizerDirection.up:
				print("Swiped up")
			default:
				break
			}
		}
	}

}

