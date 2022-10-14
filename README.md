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
- GitHub for version control

### Implementation
I started this project by choosing an API from a list of [public APIs](https://github.com/public-apis/public-apis). I thought the xkcd API would be a good fit for the project requirements so I went with that.
Write-up is a work in progress: 
- create UI
- created a model
- pulled data in
- add user functionality 

### Challenges
- Initially I was having a hard time displaying the most recent comic as the app default because I couldn't fetch API data outside of the Content View when creating my variables. I solved this by TBD
- Another issue that I faced was taking an image URL string and displaying it in the app. I was trying to use a package called Kingfisher, but was getting a lot of unexpected errors after installing the package into my project. Instead of using this package, I decided to use Swift's AsyncImage structure. This worked well and allowed me to display my images.

<br />

# Conclusion
*Explain the conclusion the my project. Did I complete the objective? What did I learn from the project? How would I expand the project in the future?*
