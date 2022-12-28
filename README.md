# *xkcd Comic Viewer App*
### Project by **`Patrick Moran`**

<table>
    <tr>
        <td><a href="https://www.paktric.com/">paktric.com</a></td>
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
- Swift, JSON
- GitHub for version control

### Implementation
I started this project by choosing an API from a list of [public APIs](https://github.com/public-apis/public-apis). I thought the xkcd API would be a good fit for the project requirements so I went with that. I began the project by designing a simple user interface and then created an API model that would allow me to read the JSON API data into my app. I added actions to all of my UI elements, implemented the logic needed to handle the API fetches, and added an addition [confetti package](https://github.com/simibac/ConfettiSwiftUI) for an added challenge. I completed the project by thoroughly testing all features on a virtual device. 

### Challenges
- When fetching new API data, I ran into an issue where the state would refresh before receiving the new data, so the UI wouldn't update. I fixed this by including a one second sleep to give time for the API fetch. For future projects, I'd like to find a better way to fix this, possibly with some sort of `wait()` system call.
- Another issue that I faced was taking the image URL that was fetched from the API and displaying it in the app. I used Swift's AsyncImage structure and it worked well, but only works for iOS 15.0 and above. In the future, I'd like to add support for previous versions by implementing a package such as [Kingfisher](https://github.com/onevcat/Kingfisher).

<br />

# Conclusion
Overall, this project taught me the basics of fetching API data and displaying it to the user. I also learned how to add packages to an app. For future projects, I'd like to experiment with responsive layouts and learn how to add accessibility features to an application. 
