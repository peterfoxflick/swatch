# swatch
ios app for saving color palettes

## The Start
I've been building basic iOS apps around swiftUI, and had used coreData before when I decieded to take it to the next level: CloudKit. I had read about using a
simple integration built by Apple that allows developers to easily bring their coredata stores to CloudKit.

## The Project
The data is quite simple, a swatch (color) stores a name, id, and color values. Swatches build up a pallete which has a name and colors. A user can add colors to a pallete, change their values, names, etc. 

## Cloudkit Integration
Using the simple integration method with SwiftUI means the colors and palletes easily sync between devices. The only shortcomming I found was difficulty in making the view refresh when new data was added via anouther device. When the app is restarted however, the new data quicly appears. 
