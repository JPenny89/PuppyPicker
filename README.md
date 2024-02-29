
# iOS Tech Task

Thank you for allowing me the opportunity to submit my technical assessment.

## Overview

I used the MVVM architectural pattern in this project and made the API calls using async/await. The first screen presents a list of dog breeds in a scrolling list using the Dogs API. When the user taps a breed from the list they are taken to a second screen which displays 10 images of the selected breed, presented in a grid. I then went a little further and added the following features:

- When the user selects one of the 10 images it takes them to a third screen where they can view the image in full.
- Added a search field to allow the user to filter the list of breeds.
- I created a view modifier named SquareImageView, which clips the size of images and prevents them from taking up too much of the screen.
- Added an app icon.
- Added an accessibility feature to the ButtonModifier which is used in the third screen. If the device's font is increased beyond a certain size, the constraints are removed and the button is able to fill the available space. This also allows room for the button text.
- Created some simple Unit Tests & UI Tests.

## If I were to continue working on this I would...

- Create a mock API response for testing.
