//
//  ViewController.swift
//  choose
//
//  Created by User15 on 2018/11/28.
//  Copyright © 2018 ee. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

struct Qna{
    var question: String
    var Ansers: [String]
    var Anser: String
    var QImage: String
    var Hint: String
}

class ViewController: UIViewController {
    
    var qans = [Qna]()
    var number = 0
    var point = 0
    
    @IBOutlet weak var QueLabel: UILabel!
    @IBOutlet var Anss: [UIButton]!
    @IBOutlet weak var Qimage: UIImageView!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var Qnum: UILabel!
    @IBOutlet weak var hints: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Startimg: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var qus: UIImageView!
    @IBOutlet var anssimg: [UIImageView]!
    @IBOutlet weak var Qnumimg: UIImageView!
    
    var playagain = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        qans = [Qna(question:"這是哪一家的甜甜圈？", Ansers:["Mister donut", "Krispy Kreme", "Haritts"], Anser:"Mister donut", QImage:"donut", Hint:"日本的"),
                Qna(question:"這是哪一家的pizza", Ansers:["pizza hut", "達美樂", "拿坡里"], Anser:"pizza hut", QImage:"pizza", Hint:"帽子屋"),
                Qna(question:"這是哪一家的薯條", Ansers:["麥當勞", "薯條三兄弟", "漢堡王"], Anser:"薯條三兄弟", QImage:"potato", Hint:"假薯條"),
                Qna(question:"這是哪一家的炸雞", Ansers:["肯德雞", "胖老爹", "拿坡里"], Anser:"胖老爹", QImage:"chicken", Hint:"老爸是肥宅"),
                Qna(question:"這是哪一家的咖啡", Ansers:["星巴克", "Let's Café", "city cafe"], Anser:"city cafe", QImage:"cafe", Hint:"-4"),
                Qna(question:"這是哪一家的牛丼", Ansers:["吉野家", "すき家", "滿燒肉丼食堂"], Anser:"吉野家", QImage:"beaf", Hint:"最早出現在台灣的"),
                Qna(question:"這是哪一家的牛排", Ansers:["西提", "王品", "茹絲葵"], Anser:"茹絲葵", QImage:"stack", Hint:"彼得潘推薦"),
                Qna(question:"這是哪一家的義大利麵", Ansers:["丹提", "薩莉亞", "全家便利商店"], Anser:"薩莉亞", QImage:"noodle", Hint:"盤子深度1公分"),
                Qna(question:"這是哪一家的壽司", Ansers:["爭鮮", "海壽司", "藏壽司"], Anser:"爭鮮", QImage:"fish", Hint:"好吃的sushi在"),
                Qna(question:"這是哪一家的牛肉麵", Ansers:["三商巧福", "牛筋學苑", "花月嵐"], Anser:"三商巧福", QImage:"beafnoodle", Hint:"清燉也很好吃"),
                Qna(question:"這是哪一家的鍋貼", Ansers:["八方雲集", "四海遊龍", "7-11便利商店"], Anser:"八方雲集", QImage:"dow", Hint:"雲門舞集"),
                Qna(question:"這是哪一家的泡麵", Ansers:["辛拉麵", "維力炸醬麵", "阿Ｑ桶麵"], Anser:"辛拉麵", QImage:"hotnoodle", Hint:"辣到屁眼開花"),
        ]
        qans.shuffle()
        
        for i in 0...11
        {
            qans[i].Ansers.shuffle()
        }
        number = 0
        point = 0
        QueLabel.text = qans[number].question
        for i in 0...2
        {
            Anss[i].setTitle(qans[number].Ansers[i], for: UIControl.State.normal)
        }
        Qimage.image = UIImage(named: qans[number].QImage)
        
        Qnum.text = "第" + String(number+1) + "題"
        points.text = String(point)
        
        QueLabel.isHidden = true
        Anss[0].isHidden = true
        Anss[1].isHidden = true
        Anss[2].isHidden = true
        Qimage.isHidden = true
        Qnum.isHidden = true
        points.isHidden = true
        pointLabel.isHidden = true
        pic.isHidden = true
        qus.isHidden = true
        anssimg[0].isHidden = true
        anssimg[1].isHidden = true
        anssimg[2].isHidden = true
        Qnumimg.isHidden = true
        
        if playagain != 0
        {
            Start.isHidden = false
            Startimg.isHidden = false
        }
        hintLabel.text = "歐齁齁齁"
    }
    
    @IBAction func StartGame(_ sender: UIButton) {
        sender.isHidden = true
        Startimg.isHidden = true
        
        QueLabel.isHidden = false
        Anss[0].isHidden = false
        Anss[1].isHidden = false
        Anss[2].isHidden = false
        Qimage.isHidden = false
        Qnum.isHidden = false
        points.isHidden = false
        pointLabel.isHidden = false
        pic.isHidden = false
        qus.isHidden = false
        anssimg[0].isHidden = false
        anssimg[1].isHidden = false
        anssimg[2].isHidden = false
        Qnumimg.isHidden = false
    }
    
    func endGame(){
        let alertController = UIAlertController(title: "結束遊戲",
                                                message: "得到了" + String(point) + "分！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "再玩一次", style: .default, handler:
        {
            (action: UIAlertAction!) -> Void in self.viewDidLoad()
            })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        self.view.setNeedsLayout()
        playagain = 1
    }
    
    func press(){
        if number == 9
        {
            endGame()
        }
        else
        {
            number = number + 1
        }
        
        QueLabel.text = qans[number].question
        for i in 0...2
        {
            Anss[i].setTitle(qans[number].Ansers[i], for: UIControl.State.normal)
        }
        Qimage.image = UIImage(named: qans[number].QImage)
        
        Qnum.text = "第" + String(number+1) + "題"
        points.text = String(point)
        if point < 30 {
            hintLabel.text = "你真的是美食家嗎？"
        }
        else if 30 < point && point < 70{
            hintLabel.text = "晉升平民美食家"
        }
        else if point > 70 {
            hintLabel.text = "我封你美食小天才"
        }
    }
    
    @IBAction func pressAns(_ sender: UIButton) {
        let cellect = sender.currentTitle!
        if cellect == qans[number].Anser
        {
            point = point + 10
            
            press()
        }
        else
        {
            press()
        }
    }
    
    @IBAction func hintPreaa(_ sender: UIButton) {
        hintLabel.text = qans[number].Hint
    }
    
    
}

