# Anacapa-Github-Hooks

1) Push event on grader-labXX repo with anacapa.json present
- Kick off A
    
2) Push event on labXX-username
- Add username, labXX to pending jobs table in database
- Kick off B

# Anacapa-Sidekiq-Pipeline

A) Compute expected results
- Given a grader-labXX repo containing an anacapa.json file
  - Parse anacapa.json, and if errors
    - update errors.md and DIE
  - run each of the test cases and store the expected output in github repo results-labXX/expected/
  
B) Compute student actual results
- Given a labXX-username repo containing a student's submission and the grader-labXX repo
    - make a copy of the anacapa.json in results-labXX/students/username/anacapa.json
        * this is to calculate the grade at stage D in case anacapa.json changes over time
    - run each of the test cases (described in anacapa.json)
    - store the actual output in results-labXX/students/username/results
- Kick off C

C) Compute Diff of expected results vs. actual results for a given students submission
- Given a results-labXX repo and a student username, compute the diff of 
    results-labXX/expected/ and results-labXX/students/username/results/ and store
    at results-labXX/students/username/diff
- Kick off D       

D) Compute grade and generate student-facing output
- Given a results-labXX repo and a student username
    - create or update the repo grade-labXX-username
    - for each test cases in results-labXX/students/username/anacapa.json:
        * examine corresponding diffs
        * compute grade
        * update student-facing grade report
        * update results-labXX/grades/(student_username).grade
- Kick off E         

E) Given student username and assignment, delete pending job from database
