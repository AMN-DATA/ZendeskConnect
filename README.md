
# react-native-zendesk-connect

## Getting started

`$ npm install react-native-zendesk-connect --save`

### Mostly automatic installation

`$ react-native link react-native-zendesk-connect`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-zendesk-connect` and add `RNZendeskConnect.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNZendeskConnect.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNZendeskConnectPackage;` to the imports at the top of the file
  - Add `new RNZendeskConnectPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-zendesk-connect'
  	project(':react-native-zendesk-connect').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-zendesk-connect/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-zendesk-connect')
  	```


## Usage
```javascript
import RNZendeskConnect from 'react-native-zendesk-connect';

// TODO: What to do with the module?
RNZendeskConnect;
```
  