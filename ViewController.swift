//
//  ViewController.swift
//  VideoPlayerYouTube
//
//  Created by Mahesh on 10/09/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    var videos:[Video] = []
    var video: Video = Video()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let video5 = Video()
        video5.key = "tKpgFc69uoA"
        video5.title = "Banna Jad Chaale (Official Video)-Raja Hasan। Kapil Jangir। Dhanraj Dadhich। Sp jodha |New Song 2020"
        videos.append(video5)
        
        let video7 = Video()
        video7.key = "MhnSJjlHiA0"
        video7.title = "Banna Jad Chaale Part 2 -Ravindra Upadhyay| Kapil Jangir| Dhanraj Dadhich | Sp jodha | Sonam thakur"
        videos.append(video7)

        let video2 = Video()
        video2.key = "Dewb1ZKT8RA"
        video2.title = "'Hu To Gaiti Mele Unplugged | હું તો ગઈ તી મેળે | Kairavi Buch"
        videos.append(video2)
        
        let video1 = Video()
        video1.key = "IQ_g_SdstGw"
        video1.title = "AMDAVADI MAN vS WILD - part 10 | INTO THE WILD Ft. AKSHAY KUMAR | Amdavadi Man"
        videos.append(video1)
        
        let video3 = Video()
        video3.key = "cMnn4A-OS_U"
        video3.title = "Ghoomar (Full Video) Anupriya Lakhawat, Kapil Jangir | New Rajasthani DJ Song 2019 "
        videos.append(video3)

        let video4 = Video()
        video4.key = "tHHbSTd4hZc"
        video4.title = "Mehandi Rang Laagi (Official Video) - Chotu Singh Rawana | Dhanraj Dadhich | Sp Jodha I Song 2020"
        videos.append(video4)
        
        
        
        let video6 = Video()
        video6.key = "dCmp56tSSmA"
        video6.title = "Diljit Dosanjh: Born To Shine (Official Music Video) G.O.A.T"
        videos.append(video6)
        
        
        
        let video8 = Video()
        video8.key = "tmLBITpyxPc"
        video8.title = "Yaari Ka Circle | Tanishk Bagchi I Darshan Raval | Jonita Gandhi"
        videos.append(video8)
        
        let video9 = Video()
        video9.key = "edd_BOnLRzQ"
        video9.title = "Piya Aao (Full Video) Kapil Jangir | Anupriya Lakhawat | Aastha Dadhich | New Rajasthani Song 2019"
        videos.append(video9)
        
        


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        cell.videoTitle.text = videos[indexPath.row].title
        
        //This URL is common URL for copy YouTube VideoImage in All Programe
        
        let url = "https://img.youtube.com/vi/\(videos[indexPath.row].key)/0.jpg"
        cell.videoImage.downloaded(from: url)
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vi = videos[indexPath.row]
        self.video = vi
        
        performSegue(withIdentifier: "toVideo", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVideo" {
            let vc = segue.destination as! VideoViewController
            vc.video = self.video
        }
    }
    
}

class Video {
    var key:String = ""
    var title:String = ""
}

extension UIImageView{
    func downloaded(from url : URL , contentMode mode : UIView.ContentMode = .scaleAspectFit){
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType?.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
                else{return}
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
            
        }
    func downloaded(from link : String, contentMode mode : UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else {
            return
        }
        downloaded(from: url, contentMode: mode)
    }
    }

