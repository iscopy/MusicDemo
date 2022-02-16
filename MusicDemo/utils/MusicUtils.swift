//
//  MusicUtils.swift
//  MusicDemo
//
//  Created by iscopy on 2022/2/16.
//

import Foundation
import UIKit
//首先导入音频框架
import AVFoundation

class MusicUtils: NSObject {
    fileprivate static var player : AVAudioPlayer?
}

// MARK: - 对歌曲的控制
extension MusicUtils: AVAudioPlayerDelegate{
    /// 播放本地音乐
    class func playLocationMusic(_ musicName : String){
        //1 获取资源的URL
        guard let url = Bundle.main.url(forResource: musicName, withExtension: nil) else { return }
        
        //0 判断和暂停/停止的对象是否同一首歌曲(继续播放的时候不会切歌)
        if player?.url == url{
            player?.play()
            return
        }
        
        //2 根据URL创建AVAudioPlayer对象
        guard let audioPlayer = try? AVAudioPlayer(contentsOf: url) else { return }
        self.player = audioPlayer
        
        //3 播放音乐
        audioPlayer.play()
    }
    /// 播放网络音乐
    class func playNetworkMusic(_ urlString : String){
        //1 获取资源的URL
        guard let url = URL.init(string: urlString) else { return }
        //0 判断和暂停/停止的对象是否同一首歌曲(继续播放的时候不会切歌)
        if player?.url == url{
            player?.play()
            return
        }
        guard let urlData = try? Data(contentsOf: url) else { return }
        
        //2 根据URL创建AVAudioPlayer对象
        guard let audioPlayer = try? AVAudioPlayer(data: urlData) else { return }
        self.player = audioPlayer
        
        //3 播放音乐
        audioPlayer.play()
    }
    
    class func pauseMusic() {
        player?.pause()
    }
    
    class func stopMusic(){
        player?.stop()
        player?.currentTime = 0
    }
}

// MARK: - 对其他的控制(音量/时间/代理设置)
extension MusicUtils{
    
    class func changeVolume(volume : Float){
        player?.volume = volume
    }
    
    class func setCurrentTime(_ currentTime : TimeInterval) {
        player?.currentTime = currentTime
    }
    
    class func getCurrentTime() -> TimeInterval{
        return player?.currentTime ?? 0
    }
    
    class func getDuration() -> TimeInterval{
        return player?.duration ?? 0
    }
    
    class func setPlayerDelegate(_ delegate : AVAudioPlayerDelegate){
        player?.delegate = delegate
    }
    
}
