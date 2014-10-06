// The contents of this file will be executed before any of
// your view controllers are ever executed, including the index.
// You have access to all functionality on the `Alloy` namespace.
//
// This is a great place to do any initialization for your app
// or create any global variables/functions that you'd like to
// make available throughout your app. You can easily make things
// accessible globally by attaching them to the `Alloy.Globals`
// object. For example:
//
// Alloy.Globals.someGlobalFunction = function(){};
// this sets the background color of the master UIView (when there are no windows/tab groups on it)

// this sets the background color of the master UIView (when there are no windows/tab groups on it)
Titanium.UI.setBackgroundColor('#fff');
var tabGroup = Titanium.UI.createTabGroup();
 
var login = Titanium.UI.createWindow({
    title:'User Authentication Demo',
    tabBarHidden:true,
    url:'main_windows/login.js'
});
 
var loginTab = Titanium.UI.createTab({
    title:"Login",
    window:login
});
 
tabGroup.addTab(loginTab);
tabGroup.open();