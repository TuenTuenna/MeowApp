//
//  ViewController.swift
//  NewAppSwift
//
//  Created by Jeff Jeong on 2019. 6. 20..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

import UIKit
// 음악재생을 위한 프레임워크
import AVFoundation

class ViewController: UIViewController {

    // outlet
    // ui  label 과 연결되어있다.
//    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var meowLabel: UILabel!
    
    // 음악재생플레이어 인스턴스화
    var catSound: AVAudioPlayer = AVAudioPlayer()
    
    // 뷰가 로드되었을때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 이미지의 컨텐트 모드 설정
        catButton.imageView?.contentMode = .scaleAspectFit
        // 야옹 라벨 숨긴다.
        meowLabel.isHidden = true
        
        // 음악 리소스를 선택
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
            
        }
        
        catch {
            print(error)
        }
        
    }
    
    // 야옹 버튼 메소드
    @IBAction func meow(_ sender: Any) {
        
        // 야옹 라벨 보여주기
        meowLabel.isHidden = false
        
        catSound.play()
        
        // 야옹 소리를 재생한다.
        // 3초 뒤에 selector 안에 있는 메소드 실행
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        
        // 라벨을 숨긴다.
        
    }
    
    // 라벨을 숨기는 메소드
    @objc func hideLabel() {
        meowLabel.isHidden = true
    }
    
    
    
}

