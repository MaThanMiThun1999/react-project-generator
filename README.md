# React Project Generator with Vite and Tailwind CSS

This repository contains a shell script to automate the setup of a new React project using Vite and Tailwind CSS. The script will create a project structure with pre-configured Tailwind CSS, and includes several example code snippets to help you get started quickly.

## Features

- Create a new Vite project with React template.
- Install and configure Tailwind CSS.
- Generate a structured project folder with example components, hooks, context providers, and more.

## Usage

### Prerequisites

- Ensure you have Node.js and npm installed.
- You may need sudo privileges to run the script.

### Instructions

1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/MaThanMiThun1999/react-project-generator.git
    cd react-project-generator
    ```

2. Make the script executable:
    ```bash
    chmod +x project-generator.sh
    ```

3. Run the script and follow the prompts to enter your project name:
    ```bash
    sudo ./project-generator.sh
    ```

4. The script will:
    - Create a new Vite project with the specified name.
    - Install Tailwind CSS and its peer dependencies.
    - Configure the Tailwind CSS setup.
    - Create a project structure with various folders and example code snippets.

5. After running the script, you will see a message like this:
    ```plaintext
    HappY CodinG
    Made bY MaThanMiThun
    ```

## Project Structure

The generated project contains the following folders:

- **assets**: Contains fonts, images, and styles.
  - `fonts/`
  - `images/`
  - `styles/`
    - `main.css`
    - `variables.css`
- **components**: Reusable UI components.
  - `Header.jsx`
  - `Footer.jsx`
  - `Button.jsx`
- **config**: Configuration files.
  - `apiConfig.js`
  - `appConfig.js`
- **context**: React context providers.
  - `AuthContext.jsx`
  - `ThemeContext.jsx`
  - `AppContext.jsx`
- **data**: Static data files.
  - `data.js`
  - `data.json`
- **hooks**: Custom React hooks.
  - `useAuth.jsx`
  - `useFetch.jsx`
  - `useLocalStorage.jsx`
- **layout**: Layout components like Navbar and Sidebar.
  - `Navbar.jsx`
  - `Sidebar.jsx`
  - `Footer.jsx`
- **pages**: Page components for different routes.
  - `Home.jsx`
  - `About.jsx`
  - `Contact.jsx`
- **services**: API service functions.
  - `api.jsx`
  - `authService.jsx`
  - `userService.jsx`
- **utils**: Utility functions and constants.
  - `helpers.jsx`
  - `constants.jsx`
  - `validations.jsx`
- **ReadMeMan**: Folder containing additional readme file.
  - `README.md`

Each folder contains example code snippets to help you get started.

## Notes

- Ensure you have `sudo` privileges to run the script as it may need to install global packages or access certain directories.

Happy coding!
