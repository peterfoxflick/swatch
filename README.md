# swatch
ios app for saving color palettes

![Image of app](https://raw.githubusercontent.com/peterfoxflick/swatch/master/apppic.png)

[![Foo](http://www.google.com.au/images/nav_logo7.png)](http://google.com.au/)

[![Get App link](https://raw.githubusercontent.com/peterfoxflick/swatch/c3f5d7044fd50900da2c01856481b2257a690a74/appStoreImg.svg)](https://apps.apple.com/us/app/swatch-saver/id1522164757)

## The Start
I've been building basic iOS apps around swiftUI, and had used coreData before when I decieded to take it to the next level: CloudKit. I had read about using a
simple integration built by Apple that allows developers to easily bring their coredata stores to CloudKit.

## The Project
The data is quite simple, a swatch (color) stores a name, id, and color values. Swatches build up a pallete which has a name and colors. A user can add colors to a pallete, change their values, names, etc. 

## Cloudkit Integration
Using the simple integration method with SwiftUI means the colors and palletes easily sync between devices. The only shortcomming I found was difficulty in making the view refresh when new data was added via anouther device. When the app is restarted however, the new data quicly appears. 
