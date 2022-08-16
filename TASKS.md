# Code Assessment Tasks

## 1. Implement product detail screen

Implement the product detail page as shown in the Figma design file: [https://www.figma.com/file/TghrEZgi3nl3t3iZ72Ufmt/Code-Assessment-Final?node-id=14%3A129](https://www.figma.com/file/TghrEZgi3nl3t3iZ72Ufmt/Code-Assessment-Final?node-id=14%3A129)

Requirements:

- It should be possible to display a product by clicking it from the main product list.
- No animation is required when switching between active images in the PDP image picker.
- Don't worry about wiring up quantity/add to bag buttons for this task.
- Our data contains some placeholder.com images for certain image types. This is expected.
- **Bonus:** Build this screen such that it can be displayed from any arbitrary point during the application's lifecycle-- i.e. from a push notification, deep link, etc.

## 2. Make the quantity selection contol reusable

You may have noticed that the stepper control in each `CartItemView` is a generic, native control. Extract it from the `CartItemView` file and replace it with your own custom stepper control class that can be used across the application throughout.

Requirements:

- Your control should mimic the existing stepper in appearance.
- Your control should be in SwiftUI and be reusable.
- **Bonus:** Add test coverage for your new control.

## 3. Connect the app to our API

Currently, our shopping cart app loads all of its data from a mock JSON file. You will replace this with calls to a real API, the documentation for which is here: [https://github.com/workco/code-assessment-api](https://github.com/workco/code-assessment-api).

Requirements:

- The app should load the list of products from our API.
- Images should be loaded in the background to ensure smooth scrolling in the master list.
- You may use either the GraphQL or REST interfaces. We have made both functionally equivalent, so choose the protocol with which you are most comfortable.
- Errors should be handled and surfaced to the user. Presenting a `UIAlertController` with a description of the error that occurred will suffice.

## 4. Implement quantity increment/decrement on the cart screen

The cart screen currently includes a +/- stepper for each item in the cart, but it doesn't do anything. Modify the `Cart` class to implement cart quantity changes.

Requirements:

- When an item's quantity is reduced to zero, the user should be asked if they want to remove the item from their cart before the item is removed. You may use a `UIAlertController` for this prompt.
- The number in the stepper control should update based on the user's interaction.
- Unit tests should be added to include coverage for the new functionality you have added.

## 5. Clean up application assets

- Use your best judgement and reduce the duplication of styles.
- Make assets more reusable.

## 6. Create Your Own!

Define and complete your own task 💪. Use this opportunity to show us your expertise in areas not otherwise covered by this assessment :)
