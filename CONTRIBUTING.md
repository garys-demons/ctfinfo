# Contributing to CTFINFO

This document is for people wanting to contribute to the implementation of ctfinfo. This involves interacting with implementation changes that are proposed using GitHub pull requests to the ctfinfo repository (which you're in right now).

### Requirements

- Flutter 3.27.1 [Download](https://flutter.dev)
- Git

### Install locally

  1. Fork the repo
   
 2. Clone it locally
    ```bash
    $ git clone https://github.com/<YOUR_USERNAME>/ctfinfo
    ```
3. cd into ctfinfo
   ```bash
   $ cd ctfinfo
   ```
1. Download dependencies
    ```bash
    $ flutter pub get
    ```
2. Run the app
   ```bash
   $ flutter run
   ```

### How to contribute

- Make a new branch for the issue you want to work on
   ```bash
   $ git branch -b bug224
   ```

- Make the required changes
- Format your code
  ```bash
  $ dart format .
  ```
- Run flutter analyzer
  ```bash
  $ flutter analyze
  ```
- Commit your changes
- Push the code to your branch and open a PR
  
