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

* User can log in, sign up, and log out
* User can view WoD and definition
* User can show that they’ve used the word and gain points
* User can see total number of points they’ve earned


**Optional Nice-to-have Stories**

* User can see list of previous words


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
| profilePicture  |  file  |  user's profile picture  |
| didLogin  | boolean  | checks if user logged in for the day, user gets one point for daily login |

#### PreviousWords
| Property   | Type   |  Description |
|---|---|---|
| wordId  | id   | daily word ID  |
| dailyWord  | string  | dailyWord  |
| definition  |  string | word definition |
| dateCreated   | DateTime   | date the word was chosen  |

#### UsedWords
| Property   | Type   |  Description |
|---|---|---|
| wordId  | id   | daily word ID  |
| userId  | id  | user's id   |
| sentenceContext  |  string | sentence in which the word was used |


### Networking
- 
Login/Register
  PUT - Create a User
  GET - Sign in already created user 
Home 
  GET - Word of the Day 
  POST - Word Usage
Previous Word List
  GET - Previous Word List 
  POST - Word of the Day 
Profile
  GET - User 


- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
