

# Osmital App
Find the place near you.



## Download and install
1. [click here to download arm64-v8a ](https://github.com/subash9860/osmital_by_GOSMD/raw/main/osmital/build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk)
2. [click here to download armeabi-v7a ](./osmital/build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk)
3. [click here to download x86 ](./osmital/build/app/outputs/flutter-apk/app-x86_64-release.apk)



### Structure of the app
- backend(osmital-back)
- mobile(osmital-app)
  
## To work on new feature
- create a issue in github and assign to yourself

### Move to local environment
### Before building, fetch everything from github
        git fetch --all
        git pull
this will get all the repo in your local machine.

## create new issue in github

then move to the local machine

- create a new branch with the name of the issue
        
        git branch <issue-name>
- Switch to the new branch
            
        git checkout <issue-name>
- you can check which branch you are in
    
        git branch

### Now start working on the feature

### When you are done, commit the changes
        
        git add . (or git add <file-name>)
        git commit -m "message"
        git push origin <issue-name>

### then merge form github 
  or do localally :
              git checkout main
              git merge <issue_name >
              git push origin main

      


      
          
