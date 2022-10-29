# *xkcd Comic Viewer App*
### Project by **`Patrick Moran`**  <br />  Computer Science Student `&&` Software Developer

<table>
    <tr>
        <td><a href="http://www.paktric.com/">paktric.com</a></td>
        <td><a href="https://www.github.com/paktric/">github.com/paktric</a></td>
        <td><a href="https://www.linkedin.com/in/paktric/">linkedin.com/in/paktric/</a></td>
    </tr>
</table>

---

<br />

# Project Overview
### Motivation
This project was a lab that was assigned in my iOS app development class. The task was to build an app that uses an API, with the following requirments:
- Pick any API that does not require authentication
- Build an app that fetches data and display the data with a UI
- Allow the user to send a request to fetch new data
- Have at least one changeable image that is based on the fetched API result

### Objective
The objective of this project is to learn how to interact with APIs in an iOS application. 

<br />

# Development Process
### Technologies Used
- Swift
- JSON
- GitHub for version control

### Implementation
I started this project by choosing an API from a list of [public APIs](https://github.com/public-apis/public-apis). I thought the xkcd API would be a good fit for the project requirements so I went with that. I began the project by designing a simple user interface and then created an API model that would allow me to read the JSON API data into my app. I added actions to all of my UI elements, implemented the logic needed to handle the API fetches, and added an addition [confetti package](https://github.com/simibac/ConfettiSwiftUI) for an added challenge. I completed the project by thoroughly testing all features on a virtual device. 

### Challenges
- When fetching new API data, I ran into an issue where the state would refresh before receiving the new data, so the UI wouldn't update. I fixed this by including a one second sleep to give time for the API fetch. For future projects, I'd like to find a better way to fix this with some sort of task completion confirmation.
- Another issue that I faced was taking an image URL string and displaying it in the app. I was trying to use a package called Kingfisher, but was getting a lot of compatibility errors after installing the package into my project. Instead of using this package, I decided to use Swift's AsyncImage structure. This worked well and allowed me to display my image, but only works for iOS 15.0 and above. In the future, I'd like to add support for previous versions as well. 

<br />

# Conclusion
Overall, this project was good practice for fetching and handling API data. I also learned how to add packages to an app. In the future, I'd like to add a more responsive design and accessibility features.
