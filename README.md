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

## License

    Copyright 2015 Jamie McDonald

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
