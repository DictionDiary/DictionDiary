import Foundation
import Parse
struct WordsAPICaller {
    static func getRandomWordRequest() {
    let headers = [
        "x-rapidapi-key": "738d71b373msh2c84965784c4bdbp15c52fjsnb20b5fcd8f5d",
        "x-rapidapi-host": "wordsapiv1.p.rapidapi.com"
    ]
    
        let request = NSMutableURLRequest(url: NSURL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                    let wordOfTheDay = dataDictionary["results"] as! [[String: Any]]
                    if dataDictionary["results"] != nil {
                        let dataResult = dataDictionary["results"] as! [[String: Any]]
                        let finalDictionary = ["word":  dataDictionary["word"] as! String, "definition": dataResult[0]["definition"] as! String, "partOfSpeech": dataResult[0]["partOfSpeech"] as! String]
                        let latestWord = PFObject(className: "PreviousWords")
                        latestWord["word"] = finalDictionary["word"]
                        latestWord["definition"] = finalDictionary["definition"]
                        latestWord["wordDate"] = Date()
                        latestWord["partOfSpeech"] = finalDictionary["partOfSpeech"]
                                
                        latestWord.saveInBackground {(success, error) in
                                    if success {
                                        print("yes")
                                    }
                                    else {
                                        print("oh no!!")
                                    }
                                }
                    }
                    else {
                        getRandomWordRequest()
                    }
                }
            }
        })
        dataTask.resume()
    }
}
