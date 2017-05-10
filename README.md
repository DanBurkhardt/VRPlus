# VRPlus
A framework for improving and speeding up VR integration in iOS applications. This project is being done as a research project and proof of concept for a class, Topics in Software Engineering at Columbia University.

## How to run & test this project
First, you much run the latest version of Xcode on an Apple Mac machine and you must be signed up with an Apple Developer account. All tools and information can be found at Developer.Apple.com

**It must be noted that this project is basically untestable on the simulator becuase the one thing you cannot simulate is actual device movement. You will NEED to run this to an actual Apple iPhone in order to fully see and test VR content.**

Once you have Xcode installed, you will need to clone my repo locally from git: http://github.com/danburkhardt/vrplus

### Making sure you have cocoapods installed
In order to use the project, you will also have to have cocoapods installed. You can check this easily by running `which pod` from the terminal. If the output looks like a the path to a directory, you are good to go. If the output is blank, you do not have it installed

In order to install cocoapods run `brew install cocoapods`. Once this process has completed, proceed to the next step.

### Installing third pary frameworks via cocoapods
Next, open terminal and CD to the root of the project directory (~/[drivelocation]/VRPlus)

Run `pod install` from the root of the project directory. The output should produce some compeletion statement about having installed Alamofire, SwiftyJSON & CardboardSDK

### Running the project
After cocoapods has completed, a new file should appear in the root of the project directory called "VRPlus.xcworkspace". Double click this file to launch the project.

Once the project has opened in Xcode, choose a simulator from the menu at the top of the left side of the Xcode IDE. You may select an iPhone 7, for example. 

Once you select a simulator to run the project to, click the Play/Run button on the upper left. This will kick of a compiler process and run the app to the simulator. 

In order to run this from an Apple device, you must plug the device into the machine and wait for the symbol files to finish processing, which takes about 10-20 mins depending on the speed of your machine. After this completes, you can run the application to the device from the same menu where you previously selected the simulator. It will be at the very top of the list.

## Notes

The API is deployed on an IBM Bluemix instance and is live. You can find the source code for that deployment here: http://github.com/danburkhardt/VRPlusAPI


