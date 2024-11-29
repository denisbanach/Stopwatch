# SwiftUI Stopwatch

A simple, elegant stopwatch app built with SwiftUI. This app demonstrates the use of SwiftUI's declarative syntax to create a timer with start, stop, and reset functionality. The stopwatch displays elapsed time in hours, minutes, and seconds in a clean and modern user interface.

## Features

- **Start and Stop Timer**: A single button toggles between starting and stopping the stopwatch.
- **Elapsed Time Display**: The elapsed time is displayed in a `hh:mm:ss` format with a bold, monospaced font.
- **Dynamic UI**: The button updates dynamically between play and stop icons depending on the timer state.
- **SwiftUI Design**: Built entirely with SwiftUI, leveraging `@State` for state management and `Timer` for real-time updates.

## Preview

<img src="readme_files/Simulator Screenshot - iPhone 16 - 2024-11-29 at 20.31.55.png" alt="alt text" width="300">


## Code Overview

### Core Logic
- **Timer**: A `Timer` instance drives the periodic updates of the elapsed time.
- **State Management**: The app uses `@State` properties to manage the timer state (`timerIsRunning`) and elapsed time (`elapsedSeconds`).

### View Highlights
- **Dynamic Label and Icon**: The button displays `play.circle` or `stop.circle` based on whether the timer is running.
- **Time Formatting**: Computed properties (`hours`, `minutes`, `seconds`) provide a clear, formatted time display.

### Example Code Snippet
```swift
Text("\(hours):\(minutes):\(seconds)")
    .fontWeight(.bold)
    .font(.system(size: 40, design: .monospaced))