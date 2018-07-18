import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    private var timer: Timer?
    private var count: Int = 180
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.timeLabel.text = "03:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// TimerのtimeIntervalで指定された秒数毎に呼び出されるメソッド
    @objc func onUpdate(timer : Timer){
        if(self.count == 0) { return }
        // カウントの値1増加
        self.count -= 1
        //  分、秒を計算
        let minutesLeft = self.count / 60 % 60
        let secondsLeft = self.count % 60
        //  ラベルに入れる文字列を作成
        let minutesStr = String(format: "%02d", minutesLeft)
        let secondsStr = String(format: "%02d", secondsLeft)
        self.timeLabel.text = "\(minutesStr):\(secondsStr)"
    }
        

    @IBAction func touchUpStart(_ sender: Any) {
        //  timerを作成
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onUpdate(timer:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func touchUpStop(_ sender: Any) {
        //  timerを停止
        self.timer?.invalidate()
    }
    
    @IBAction func touchUpReset(_ sender: Any) {
        self.count = 180
        self.timeLabel.text = "03:00"
    }
}

