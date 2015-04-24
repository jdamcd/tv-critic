This is a tiny Sinatra app to generate an HTML page of Android/iOS app reviews. The output is intended to be displayed on a TV as an information radiator.

## Deploying with Heroku

1. `heroku create your-app-name`
2. `heroku addons:add memcachier:dev`
3. Set `GOOGLE_LOGIN` and `GOOGLE_PASSWORD` in environment
4. `git push heroku`

## Usage

#### Android 

`/android/:app_id` e.g. `/android/com.jdamcd.sudoku`

#### iOS

`/ios/:app_id` e.g. `/ios/336353151`
