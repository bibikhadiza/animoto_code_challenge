# Animoto Captcha Assignment

## Challenge requirements
1.	Devise a type of CAPTCHA for troll aliens to keep them out of forums
2.	Write a server that does 2 things
	a. Respond to a client HTTP request with at least the following in the response body:
		• A random body of text. Some sample texts are included.
		• A list of some but not all words in that body of text (exception: texts with only one unique word should use an empty 		list)
		
	b. Receive a client HTTP request with at least the following in the request
		• A body of text
		• A list of some but not all words in that body of text (exception: texts with only one unique word should have an empty 		list)
		• A count of the frequency of every word in the body of text excluding words from the list 
	   and respond with:
	   	• If the word frequency count is correct, then 200 OK
		• If the word frequency count is incorrect or the request is otherwise invalid, then 400 Bad Request
		
3.	Write tests to assert the correctness of source code
4.	Include Readme
5.	Have Fun!

## App Description

The purpose of this app is to identify aliens through a captcha challenge. When user navigates to the root page, they are presented with a button. Clicking on the button triggers a click event, removes the button element from the DOM and replaces it with a phrase, a form with an input tag and in most cases a few words to avoid in the word count. Once the user submits the form, a submit event is triggered and eventually an ajax call is made to the backend server with the parameters. Backend API runs algorithmic equations to check if user input is indeed the valid word count. If user input is the valid word count, a 200 status response is sent back to the ajax success function. If not, a 400 bad request status is sent back to the ajax error function. 

If this is the first time the user has inputed a invalid word count, the user will be asked to try again. If the user already inputed an invalid word count, DOM elemets will be removed and replaced with a message, identifying the user as an alien. During the two tries, if the user inputs the correct word count, DOM elements will be removed and replaced with a message, identifying the user as a human.

I have decided to build this application with Ruby and Sinatra over Ruby on Rails due to the fact that the Rails framework would be too leavy for this simple challenge. I've also decived to build this application in Ruby beacause the Animoto software is built in Ruby. If I were to redo this application, I would create a single page application using a lightweight library such as React.


## Setup Installation/Compatibility/Execution
1.	Clone repo
2.	run 'bundle install' in command line
3.	run shotgun in command line
2.	Open either Chrome, Firefox, or Safari browsers
3.	Navigate to 'localhost:' followed by the port to execute

### Features:
1.	Consits MVC design pattern
2.	API results are formatted and displayed
3.	Integration of jQuery to elimenate page refresh
4. 	Single point of input
5. 	Stateless application

## Rspec Testing - Unit and Controller tests
1.	Execution - run 'rspec' in command line

### Tools/Tech Stack
Front End
1.	Vanilla Javascript/ES6
2.	HTML/HTML5
3.	CSS/CSS3
4.	jQuery

Back End
1.	Ruby
2.	Sinatra

Version Control
1) Github

###	Future Considerations 
1. 	Integreate last bonus feature - When the server receives text, exclusion words, and a word count from the client, it verifies that 	   the text and exclusion words that it previously gave a client
2. 	Add a script ./run to start the server and The server should run on localhost:8000 and serve a single path /
3.	Code Deploy for rapid future releases
		a.	Docker
		b.	Heroku
		c.	AWS
4.	Write integration tests using Capybara
5.	Refactor in React.js with Redux
6. 	I had given myself a time limit to complete this assignment and was not able to complete #3 on the Animoto Word Count Validator 	Readme Guidline. For future considerations, I would complete #3 on the guideline.  

