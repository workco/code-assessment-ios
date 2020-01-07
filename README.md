# Work & Co iOS Code Assessment ⭑⭑

This is an iOS port of the [Work & Co Web Code Assessment](https://github.com/workco/code-assessment-web).

## Instructions

### 1. Mirror the Repo

For your own privacy, please do not fork this repo! Instead, follow these instructions to mirror the repository to a new private repo on your account:

1. Create a new **private** repo on your github (eg, my-assessment)

2. On the command line, create a bare clone of our repo:

```
git clone --bare git@github.com:workco/code-assessment-ios.git
```

3. Enter the temporary directory created by that command and push to your repo

```
cd code-assessment-ios
git push --mirror git@github.com:my-github-account/my-assessment.git
```

4. Clone the repo to start local development

```
git clone git@github.com:my-github-account/my-assessment
```

PS: Having trouble with these instructions? Reply to the talent team with your questions.

### 2. Implement Your Task(s)

Please refer to emailed instructions from the talent team as to which/how many tasks to work on. See the master task list [here](/TASKS.md).

[Create a pull request](https://help.github.com/en/desktop/contributing-to-projects/creating-a-pull-request) for each task you work on (except #5). Set this up like you would a real PR. Some features we’ll look for:

- Informative, consistent commit message(s)
- A detailed PR description. Explain the fixes or functionalities accomplished, any decisions you made along the way, or alternative implementations you may have considered or attempted. Feel free to add images and videos.
- If applicable: Why did you choose this task?

You can merge the PR when you’re done. Implement your tasks in any order you'd like.

## Guidelines and Tips

- This assessment is intended to evaluate your skills as a developer. Among other things, we'll be evaluating the quality and consistency of your code, and architectural decisions you have made.
- Caching and persistence are not required.
- Feel free to use any external libraries you like, but be prepared to explain the reasoning behind their selection.
- Your app only needs to support iPhone screen sizes. It doesn’t have to be universal.
- For the API communication tasks, you may use either provided API (i.e. GraphQL or REST). They are functionally equivalent.