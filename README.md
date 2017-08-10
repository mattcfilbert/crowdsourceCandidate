# crowdsourceCandidate

I used Ruby on Rails to create an app that provides:

- VOTERS with an opportunity to have a greater say in who runs for office in their district.
- CANDIDATES with a platform to get their name and message out without needing connections or deep pockets.
- PARTIES with data on what candidates are popular with voters in races they may lack detailed information on.

1. USER EXPERIENCE

The app functions differently for USERS depending on whether they are VOTERS or CANDIDATES.

VOTERS

A VOTER does not have to sign up to use the app. When they begin their journey, they are greeted by a prompt asking for their zip code. This is a way to get a lot of information about their location without asking for too much (like their address). (Also, most people know their zip code, but not their congressional district, their state senate district, etc.)

VOTERS are then taken to a landing page for their zip code. It has some basic info for the zip code (its primary city, its school district, etc) as well as its congressional district(s), its state senate district, and its state house district. Each of these districts have links to their respective landing pages and a preview of their top 3 most popular candidates.

VOTERS can then go to a district page and see its full list of candidates, arranged by party and ranking by number of votes. They can then click on a candidate and view their profile page to get more information and to cast a vote for that candidate.

Casting a vote is similar to posting a comment. A brief reason must be typed for the vote, and then it can be submitted anonymously.

CANDIDATES

A CANDIDATE must sign up (via the system for USERS I built via the gem DEVISE) to run for office on the app. They create their profile via the district they want to run in. Their profile requires a name and a party (it may also include an "About" section, an image, and a slogan). CANDIDATES have basic CRUD (create, read, update, destroy) control over their profiles.

2. APPROACH

I modeled much this app after a basic blog posting app, Scribble, that was used as an example in my Web Dev class. Districts are like blogs, candidates are like posts a blog, votes are like comments on a post (that scale up their candidate's vote count when created).

The zip code search function is a hacked reworking of a "post" form. The function it calls on in the zipcodes_controller is a "create" function... but instead of doing what a traditional create function does, it redirects to a url based on the input on the form.

3. INSTALLATION INSTRUCTIONS

There are a variety of guides (like [this one](https://help.github.com/articles/cloning-a-repository/)) that can provide you with the knowledge required to create a local copy of a repo on Github.

Fork and clone this repo.

Once you have cloned this repo locally (assuming Ruby on Rails is good to go on your local machine), find this repo in your terminal and run "rails s" to start the server.

4. UNSOLVED PROBLEMS/FUTURE UPDATES

- My hacked together zip code search function cannot be successfully rescued by the usual means when a zip code that does not exist is entered.

- I plan on adding primary issues to candidates and allowing voters to search for them via these issues.

- I also plan on adding more types of candidates.

5. IF I COULD DO IT AGAIN...

I would not create separate models for the different types of districts (and candidates, and votes...).
