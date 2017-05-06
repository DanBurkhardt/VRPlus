//
//  VRViewController.swift
//  VRPlus
//
//  Created by Daniel Burkhardt on 4/18/17.
//  Copyright © 2017 Giganom LLC. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class VRViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Variables
    // Defaults
    public var url: String = ""
    public var color: UIColor = UIColor.white
    public var playlistTitle: String = ""
    var tableViewData:JSON = [:]
    var videoID: String = ""
    
    @IBOutlet weak var vrOverlay: GCSVideoView!
    @IBAction func closeButton(_ sender: Any) {
        self.vrOverlay.stop()
        self.vrOverlay.isHidden = true
    }
    
    // MARK: - Outlets
    @IBOutlet weak var loadingMessage: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewNavigationBar: PlaylistTableView!
    
    // Playlist retrival classes
    //var youTubeData: YouTubeData
    // TODO: - Add support for Vimeo, third party platforms
    
    // MARK: - Data Retrieval and Processing
    var youTubeData = YouTubeData(url: "")
    
    // MARK: - Bluemix App Functions
    func getVideo(id: String){
        self.videoID = id
        self.showLoadingInfo()
        // program a two second delay before returning
        Alamofire.request("https://vrplus.mybluemix.net/downloadVideo?videoID=\(id)").responseJSON { response in
            //print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            var timer = Timer()
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: Selector("loadVRVideo"), userInfo: nil, repeats: false)
        }
    }
    
    // MARK: - Cardboard SDK Functions
    func loadVRVideo(){
        var url = "https://vrplus.mybluemix.net/getVideo?videoID=\(self.videoID)"
        print("Load video called from url: "+url)
        self.vrOverlay.isHidden = false
        self.vrOverlay.enableCardboardButton = true
        self.vrOverlay.load(from: URL(string: url))
        self.hideLoadingInfo()
    }
    
    // MARK: - Loading Functions
    func hideLoadingInfo(){
        self.loadingMessage.isHidden = true
        self.loadingIndicator.stopAnimating()
    }
    func showLoadingInfo(){
        // Reset any message and show
        self.loadingMessage.text = "Loading.."
        self.loadingMessage.isHidden = false
        self.loadingIndicator.startAnimating()
    }
    func presentLoadingError(message: String){
        self.loadingIndicator.startAnimating()
        self.loadingMessage.text = message
        self.loadingMessage.isHidden = false
    }
    
    // MARK: - Tableview Delegate Functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! PlaylistTableViewCell
        let item = self.tableViewData[indexPath.row]
        cell.title.text = item["snippet"]["title"].string
        cell.byLabel.text = item["snippet"]["channelTitle"].string
        cell.descriptionBox.text = item["snippet"]["description"].string
        
        let location = item["snippet"]["thumbnails"]["standard"]["url"].string
        if location != nil {
            Alamofire.request(location!).responseJSON { response in
                if let data = response.data {
                    let image = UIImage(data: data)
                    cell.previewImage.image = image
                }
            }
        }
        //cell.vrView.load(from: URL(string: Media.videoURL))
        //cell.vrView.enableCardboardButton = true
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Extract and concatonate
        let item = self.tableViewData[indexPath.row]
        let videoID = item["snippet"]["resourceId"]["videoId"].string as! String
        let url = "https://www.youtube.com/watch?v=\(videoID)"
        
        // Load and display
        self.getVideo(id: videoID)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.count
    }
    func reloadTable(){
        self.tableView.reloadData()
    }
    
    // MARK: - Default Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        print("viewURL: \(self.url)")
        if self.url != ""{
            self.youTubeData = YouTubeData(url: self.url)
            self.youTubeData.getData(completion: { (complete: Bool) in
                if complete == true{
                    print(self.youTubeData.jsonData)
                    self.tableViewData = self.youTubeData.jsonData["items"]
                    self.reloadTable()
                }else{
                    print("failure")
                }
            })
        }else{
            self.presentLoadingError(message: "No playlist url provided.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
