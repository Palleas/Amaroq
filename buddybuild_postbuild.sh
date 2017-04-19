#!/bin/bash

brew update
brew install infer

infer --reactive -- xcodebuild -workspace DireFloof.xcworkspace -scheme DireFloof -configuration Debug -sdk iphonesimulator clean build
