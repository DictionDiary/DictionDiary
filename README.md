Original App Design Project - README Template
===

# DictionDiary

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
A mobile application to allow users to learn new words and expand their vocabulary

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** 
- **Mobile:**
- **Story:**
- **Market:**
- **Habit:**
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] User can log in, sign up, and log out

- [X] User can view WoD and definition

- [X] User can show that they’ve used the word and gain points

- [X] User can see total number of points they’ve earned


**Optional Nice-to-have Stories**

- [X] User can see list of previous words


### 2. Screen Archetypes

* Login / Register - User signs up or logs into their account
   * User goes to home page
   * User can see the word of the day
   * User can now view their profile 
   * User can now view previous words learned
   * User can input that they used the word and get points
* Profile
   * User can view how many points they have earned
* Previous word list
   * User can view the words that they learned in the past, how they used them, and the date
   

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Profile
* Previous word list

**Flow Navigation** (Screen to Screen)

* Login/ Register
   * Home
   * Previous word list
* Home
   * Profile
   * Previous word list
 
* Profile
   * Home
   * Previous word list


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.postimg.cc/8kZzDfzN/IMG-0315.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
#### Users
| Property   | Type   |  Description |
|---|---|---|
| userId  | id   | user's ID  |
| name  | string  | user's name  |
| username  |  id | user's username  |
| points   | number   | total points accumulated  |

#### PreviousWords
| Property   | Type   |  Description |
|---|---|---|
| wordId  | id   | daily word ID  |
| dailyWord  | string  | dailyWord  |
| definition  |  string | word definition |
| dateCreated   | DateTime   | date the word was chosen  |


### Networking

* Login/Register 
  * PUT - Create a User
  * GET - Sign in already created user 
* Home 
  * GET - Word of the Day 
  * POST - Word Usage 
* Previous Word List
  * GET - Previous Word List  
  * POST - Word of the Day 
* Profile
  * GET - User 


* Login GET Request
   ```
   PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if (user != nil) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("oh no! \(String(describing: error?.localizedDescription))")
            }
        }
      ```
* Register POST request
   ```
   user.signUpInBackground{(success,error) in
            if (success) {
                                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                                }
            else {
                print("oh no! \(String(describing: error?.localizedDescription))")
            }
        }
    ```
* Previous Words GET Request
  ```
   let pastWordsQuery = PFQuery(className: "PreviousWords")
        pastWordsQuery.includeKey("id")
        pastWordsQuery.limit = 20
        pastWordsQuery.findObjectsInBackground { (pastWords,error) in
            if posts != nil {
                print("hooray!")
                self.pastWordsArray = pastWords!
                self.myRefreshControl.endRefreshing()

                self.tableView.reloadData()
            }
            else {
                print("empty...")
            }
        }
   ```
* Word Usage POST Request
  ```
   let usedWord = PFObject(className: "UsedWords")
        usedWord["wordId"] = wordId
        usedWord["user"] = PFUser.current()!
        usedWord["sentenceContext"] = setnece.text as? String
        
        post.saveInBackground {(success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print("oh no!!")
            }
        }
  ```
  * Profile GET Request
    ```
      currentUser = PFUser.current()!
      profileUsername.text = currentUser["username"] as? String
      
      let imageFile = currentUser["profilePicture"] as! PFFileObject
      let imageUrl = imageFile.url!
      let url = URL(string: imageUrl)!
      profilePicture.af.setImage(withURL: url)
      profileName.text = currentUser["name"] as? String
      profilePoints.text = currentUser["points"] as? String


    ```
* Previous Words POST Request
  ```
   let previousWord = PFObject(className: "PreviousWords")
        PreviousWords["word"] = wod
        PreviousWords["wordId"] = wodId
        PreviousWords["definition"] = definition
        PreviousWords["dateCreated"] = Date.Now()
        
        
        previousWord.saveInBackground {(success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print("oh no!!")
            }
        }
  ```
  
  * Word of the day GET Request
    ```
    let request = NSMutableURLRequest(url: NSURL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
     request.httpMethod = "GET"
     request.allHTTPHeaderFields = headers
    ```
        
#### Words API Endpoint
| HTTP Verb   | Enpoint   |  Description |
|---|---|---|
| GET  | /random   | gets random word, definition, and part of speech  |


#### Build Progress
Login, view WoD, view total points, use word
<img src="https://media.giphy.com/media/m1VkzSmngRkrwZWIFQ/giphy.gif">
