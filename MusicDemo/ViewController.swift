//
//  ViewController.swift
//  MusicDemo
//
//  Created by iscopy on 2022/2/15.
//

import UIKit

//首先导入音频框架
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - 名称
    @IBOutlet weak var tvMusicName: UILabel!
    
    
    //MARK: - 开始
    @IBAction func btnStart(_ sender: Any) {
        tvMusicName.text = self.music[self.postion]
        print("\(self.postion) \(self.music[self.postion])")
        MusicUtils.playLocationMusic(self.music[self.postion])
    }
    
    //MARK: - 暂停
    @IBAction func btnSuspend(_ sender: Any) {
        MusicUtils.pauseMusic()
    }
    
    //MARK: - 上一曲
    @IBAction func btnLastSong(_ sender: Any) {
        if self.postion == 0{
            self.postion = self.music.count-1
        }else{
            self.postion = self.postion-1
        }
        tvMusicName.text = self.music[self.postion]
        print("\(self.postion) \(self.music[self.postion])")
        MusicUtils.playLocationMusic(self.music[self.postion])
    }
    
    //MARK: - 下一曲
    @IBAction func btnNextSong(_ sender: Any) {
        if self.postion == self.music.count-1{
            self.postion = 0
        }else{
            self.postion = self.postion+1
        }
        tvMusicName.text = self.music[self.postion]
        print("\(self.postion) \(self.music[self.postion])")
        MusicUtils.playLocationMusic(self.music[self.postion])
    }
    
    var postion:Int = 0
    var music:Array = [String]()
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        music.append("等什么君 - 岁月神偷（翻自 金玟岐）.mp3")
        music.append("多多poi - 02的爱恋（Feat.约谈人参）（翻自 约谈人参）.mp3")
        music.append("排骨教主 - 牵丝戏.mp3")
    }
    
    
}

