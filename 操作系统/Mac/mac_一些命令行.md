### MAC 一些命令行
- 显示隐藏的文件夹		：
	
	```
	defaults write com.apple.finder AppleShowAllFiles TRUE
	defaults write com.apple.finder AppleShowAllFiles -bool true
	```
	
- 不显示隐藏的文件夹	：
	
	```
	defaults write com.apple.finder AppleShowAllFiles FALSE
	defaults write com.apple.finder AppleShowAllFiles -bool false
	```
- 重启Finder			：`killall Finder`