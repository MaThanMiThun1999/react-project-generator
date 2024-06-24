#!/bin/bash

# Instructions for the user
echo "Make it Executable:
Run chmod +x project-generator.sh to make it executable.
Execute the Script:
Run sudo ./project-generator.sh and follow the prompts to enter your project name."



# Function to read the project name from the user
read -p "Enter your project name: " project_name

# Step 1: Create a new React app with Vite
npm create vite@latest $project_name -- --template react

# Step 2: Navigate into your project directory
cd $project_name

# Step 3: Install Tailwind CSS and its peer dependencies
npm install -D tailwindcss postcss autoprefixer

# Step 4: Initialize Tailwind CSS configuration (generates tailwind.config.js and postcss.config.js)
npx tailwindcss init -p

# Step 5: Modify tailwind.config.js to include proper content configuration
echo '/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}' > tailwind.config.js

# Step 6: Update your main CSS file (usually src/index.css) to include Tailwind directives
echo '@tailwind base;
@tailwind components;
@tailwind utilities;

@layer utilities {
  @keyframes gradient {
    0% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }

  .animate-gradient {
    background-size: 200% 200%;
    animation: gradient 5s ease infinite;
  }
}
' > src/index.css

# Step 7: Add a simple example in App.jsx to use Tailwind CSS
echo "export default function App() {
  return (

    // Dont Forget To Remove Some Custom Styles In index.css

    <div className='h-screen flex items-center justify-center bg-gray-900'>
    <div className='bg-white bg-opacity-10 backdrop-filter backdrop-blur-lg p-10 rounded-lg shadow-lg text-center border border-gray-200 border-opacity-30'>
      <h1 className='text-4xl font-extrabold mb-6 text-transparent bg-clip-text bg-gradient-to-r from-pink-500 via-red-500 to-yellow-500 animate-gradient'>
        HappY Coding...
      </h1>
      <h6 className='text-lg text-gray-300 mb-4'>
        This is a simple React App created using Vite.
      </h6>
      <h6 className='text-sm text-gray-300 animate-pulse'>
        Made WiTh LoVe <span className='font-bold text-transparent bg-clip-text bg-gradient-to-r from-pink-500 via-red-500 to-yellow-500 animate-gradient'>MaThanMiThun</span>
      </h6>
    </div>
  </div>
  )
}
" > src/App.jsx

#!/bin/bash

# Create directories
mkdir -p src/assets/fonts src/assets/images src/assets/styles
mkdir -p src/components src/config src/context src/data
mkdir -p src/hooks src/layout src/pages src/services src/utils
mkdir -p src/ReadMeMan

# Create files with example content

# assets/fonts/custom-font.woff
touch src/assets/fonts/custom-font.woff

# assets/images/logo.png
touch src/assets/images/logo.png

# assets/styles/main.css
echo "/* main.css */
body {
    font-family: 'Custom Font', sans-serif;
}" > src/assets/styles/main.css

# assets/styles/variables.css
echo "/* variables.css */
:root {
    --primary-color: #4caf50;
}" > src/assets/styles/variables.css

# config/apiConfig.js
echo "const apiConfig = {
    baseUrl: 'https://api.example.com',
    timeout: 5000
};

export default apiConfig;" > src/config/apiConfig.js

# config/appConfig.js
echo "const appConfig = {
    appName: 'My React App',
    version: '1.0.0'
};

export default appConfig;" > src/config/appConfig.js

# context/AuthContext.jsx
echo "import React, { createContext, useState } from 'react';

export const AuthContext = createContext();

const AuthProvider = ({ children }) => {
    const [isAuthenticated, setIsAuthenticated] = useState(false);

    const login = () => setIsAuthenticated(true);
    const logout = () => setIsAuthenticated(false);

    return (
        <AuthContext.Provider value={{ isAuthenticated, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
};

export default AuthProvider;" > src/context/AuthContext.jsx

# context/ThemeContext.jsx
echo "import React, { createContext, useState } from 'react';

export const ThemeContext = createContext();

const ThemeProvider = ({ children }) => {
    const [theme, setTheme] = useState('light');

    const toggleTheme = () => {
        setTheme((prevTheme) => (prevTheme === 'light' ? 'dark' : 'light'));
    };

    return (
        <ThemeContext.Provider value={{ theme, toggleTheme }}>
            {children}
        </ThemeContext.Provider>
    );
};

export default ThemeProvider;" > src/context/ThemeContext.jsx

# context/AppContext.jsx
echo "import React, { createContext, useState } from 'react';

export const AppContext = createContext();

const AppProvider = ({ children }) => {
    const [state, setState] = useState({});

    const updateState = (newState) => {
        setState(prevState => ({ ...prevState, ...newState }));
    };

    return (
        <AppContext.Provider value={{ state, updateState }}>
            {children}
        </AppContext.Provider>
    );
};

export default AppProvider;" > src/context/AppContext.jsx

# data/data.js
echo "export const data = [
    {
        id: 1,
        name: 'John Doe',
        age: 30
    },
    {
        id: 2,
        name: 'Jane Smith',
        age: 25
    }
];" > src/data/data.js

# data/data.json
echo '[
    {
        "id": 1,
        "name": "John Doe",
        "age": 30
    },
    {
        "id": 2,
        "name": "Jane Smith",
        "age": 25
    }
]' > src/data/data.json

# hooks/useAuth.jsx
echo "import { useContext } from 'react';
import { AuthContext } from '../context/AuthContext';

const useAuth = () => {
    return useContext(AuthContext);
};

export default useAuth;" > src/hooks/useAuth.jsx

# hooks/useFetch.jsx
echo "import { useState, useEffect } from 'react';

const useFetch = (url) => {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await fetch(url);
                const result = await response.json();
                setData(result);
            } catch (err) {
                setError(err);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [url]);

    return { data, loading, error };
};

export default useFetch;" > src/hooks/useFetch.jsx

# hooks/useLocalStorage.jsx
echo "import { useState } from 'react';

const useLocalStorage = (key, initialValue) => {
    const [storedValue, setStoredValue] = useState(() => {
        try {
            const item = window.localStorage.getItem(key);
            return item ? JSON.parse(item) : initialValue;
        } catch (error) {
            console.error(error);
            return initialValue;
        }
    });

    const setValue = (value) => {
        try {
            const valueToStore = value instanceof Function ? value(storedValue) : value;
            setStoredValue(valueToStore);
            window.localStorage.setItem(key, JSON.stringify(valueToStore));
        } catch (error) {
            console.error(error);
        }
    };

    return [storedValue, setValue];
};

export default useLocalStorage;" > src/hooks/useLocalStorage.jsx

# Create the components folder
mkdir src/components

# Create Header.jsx
echo "import React from 'react';

const Header = () => {
  return (
    <header>
      <nav>
        <ul>
          <li><a href='/'>Home</a></li>
          <li><a href='/about'>About</a></li>
          <li><a href='/contact'>Contact</a></li>
        </ul>
      </nav>
    </header>
  );
};

export default Header;" > src/components/Header.jsx

# Create Footer.jsx
echo "import React from 'react';

const Footer = () => {
  return (
    <footer>
      <p>&copy; 2024 My React App</p>
    </footer>
  );
};

export default Footer;" > src/components/Footer.jsx

# Create Button.jsx
echo "import React from 'react';

const Button = ({ onClick, label }) => {
  return (
    <button onClick={onClick}>
      {label}
    </button>
  );
};

export default Button;" > src/components/Button.jsx

# Create Card.jsx
echo "import React from 'react';

const Card = ({ title, description }) => {
  return (
    <div className='card'>
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
};

export default Card;" > src/components/Card.jsx

# Create the config folder
mkdir src/config

# Create apiConfig.js
echo "// apiConfig.js
const apiUrl = 'https://api.example.com';
export default apiUrl;" > src/config/apiConfig.js

# Create appConfig.js
echo "// appConfig.js
const appName = 'My React App';
const appVersion = '1.0.0';
export { appName, appVersion };" > src/config/appConfig.js

# components/Modal.jsx
echo "import React from 'react';

const Modal = ({ isOpen, onClose, children }) => {
    if (!isOpen) return null;

    return (
        <div className='modal'>
            <div className='modal-content'>
                <button onClick={onClose}>Close</button>
                {children}
            </div>
        </div>
    );
};

export default Modal;" > src/components/Modal.jsx

# components/Header.jsx
echo "import React from 'react';

const Header = () => (
    <header>
        <h1>Header</h1>
    </header>
);

export default Header;" > src/components/Header.jsx

# components/Footer.jsx
echo "import React from 'react';

const Footer = () => (
    <footer>
        <p>© 2023 My Company</p>
    </footer>
);

export default Footer;" > src/components/Footer.jsx

# ReadMeMan/README.md
echo "# Project Directory Structure

## Overview

This project follows a structured directory layout for better organization and maintainability. Each folder has a specific purpose, and the example code snippets provided demonstrate common patterns and practices.

## Directory Structure

### src/assets

Contains static assets like fonts, images, and styles.

- **fonts/**: Custom fonts.
- **images/**: Image files.
- **styles/**: CSS files.

### src/components

Reusable React components.

### src/config

Configuration files for the application, such as API and app settings.

### src/context

Context providers for managing global state using React Context API.

### src/data

Static data files in JavaScript and JSON formats.

### src/hooks

Custom hooks for encapsulating reusable logic.

### src/layout

Layout components like Navbar, Sidebar, and Footer.

### src/pages

Page components representing different routes in the application.

### src/services

Service files for handling API requests and business logic.

### src/utils

Utility functions and constants.

## Example Code Snippets

### Custom Hook: useFetch

\`\`\`jsx
import { useState, useEffect } from 'react';

const useFetch = (url) => {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await fetch(url);
                const result = await response.json();
                setData(result);
            } catch (err) {
                setError(err);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [url]);

    return { data, loading, error };
};

export default useFetch;
\`\`\`

### Context Provider: AuthContext

\`\`\`jsx
import React, { createContext, useState } from 'react';

export const AuthContext = createContext();

const AuthProvider = ({ children }) => {
    const [isAuthenticated, setIsAuthenticated] = useState(false);

    const login = () => setIsAuthenticated(true);
    const logout = () => setIsAuthenticated(false);

    return (
        <AuthContext.Provider value={{ isAuthenticated, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
};

export default AuthProvider;
\`\`\`

## More Details

Each folder and file has been designed to serve a specific purpose in the application. Refer to the example snippets above for common usage patterns.

" > src/ReadMeMan/README.md

# Additional component example files

# components/Alert.jsx
echo "import React from 'react';

const Alert = ({ type, message }) => (
    <div className={\`alert alert-\${type}\`}>
        {message}
    </div>
);

export default Alert;" > src/components/Alert.jsx

# components/Loader.jsx
echo "import React from 'react';

const Loader = () => (
    <div className='loader'>
        Loading...
    </div>
);

export default Loader;" > src/components/Loader.jsx

# components/Tooltip.jsx
echo "import React from 'react';

const Tooltip = ({ text, children }) => (
    <div className='tooltip'>
        {children}
        <span className='tooltip-text'>{text}</span>
    </div>
);

export default Tooltip;" > src/components/Tooltip.jsx

# hooks/useToggle.jsx
echo "import { useState } from 'react';

const useToggle = (initialValue = false) => {
    const [value, setValue] = useState(initialValue);

    const toggle = () => {
        setValue(!value);
    };

    return [value, toggle];
};

export default useToggle;" > src/hooks/useToggle.jsx

# services/loggerService.jsx
echo "const loggerService = {
    log: (message) => {
        console.log(message);
    },
    error: (message) => {
        console.error(message);
    }
};

export default loggerService;" > src/services/loggerService.jsx

# services/storageService.jsx
echo "const storageService = {
    setItem: (key, value) => {
        localStorage.setItem(key, JSON.stringify(value));
    },
    getItem: (key) => {
        const item = localStorage.getItem(key);
        return item ? JSON.parse(item) : null;
    },
    removeItem: (key) => {
        localStorage.removeItem(key);
    }
};

export default storageService;" > src/services/storageService.jsx

# pages/Profile.jsx
echo "import React from 'react';

const Profile = () => (
    <div>
        <h1>Profile Page</h1>
    </div>
);

export default Profile;" > src/pages/Profile.jsx

# pages/Settings.jsx
echo "import React from 'react';

const Settings = () => (
    <div>
        <h1>Settings Page</h1>
    </div>
);

export default Settings;" > src/pages/Settings.jsx

# layout/Header.jsx
echo "import React from 'react';

const Header = () => (
    <header>
        <h1>Header</h1>
    </header>
);

export default Header;" > src/layout/Header.jsx

# layout/Footer.jsx
echo "import React from 'react';

const Footer = () => (
    <footer>
        <p>© 2023 My Company</p>
    </footer>
);

export default Footer;" > src/layout/Footer.jsx

# layout/Sidebar.jsx
echo "import React from 'react';

const Sidebar = () => (
    <aside>
        <h2>Sidebar</h2>
    </aside>
);

export default Sidebar;" > src/layout/Sidebar.jsx

# utils/dateUtils.jsx
echo "export const dateUtils = {
    formatDate: (date) => {
        return new Intl.DateTimeFormat('en-US', {
            year: 'numeric',
            month: 'long',
            day: '2-digit'
        }).format(new Date(date));
    },
    parseDate: (dateString) => {
        return new Date(dateString);
    }
};" > src/utils/dateUtils.jsx

# utils/mathUtils.jsx
echo "export const mathUtils = {
    add: (a, b) => a + b,
    subtract: (a, b) => a - b,
    multiply: (a, b) => a * b,
    divide: (a, b) => a / b
};" > src/utils/mathUtils.jsx

# Additional context example

# context/UserContext.jsx
echo "import React, { createContext, useState } from 'react';

export const UserContext = createContext();

const UserProvider = ({ children }) => {
    const [user, setUser] = useState(null);

    const login = (userData) => setUser(userData);
    const logout = () => setUser(null);

    return (
        <UserContext.Provider value={{ user, login, logout }}>
            {children}
        </UserContext.Provider>
    );
};

export default UserProvider;" > src/context/UserContext.jsx

# hooks/useUser.jsx
echo "import { useContext } from 'react';
import { UserContext } from '../context/UserContext';

const useUser = () => {
    return useContext(UserContext);
};

export default useUser;" > src/hooks/useUser.jsx

# README.md
echo "# React Project Structure

This project follows a structured directory layout for better organization and maintainability. Each folder has a specific purpose, and example code snippets provided demonstrate common patterns and practices.

## Directory Structure

### src/assets

Contains static assets like fonts, images, and styles.

- **fonts/**: Custom fonts.
- **images/**: Image files.
- **styles/**: CSS files.

### src/components

Reusable React components.

### src/config

Configuration files for the application, such as API and app settings.

### src/context

Context providers for managing global state using React Context API.

### src/data

Static data files in JavaScript and JSON formats.

### src/hooks

Custom hooks for encapsulating reusable logic.

### src/layout

Layout components like Navbar, Sidebar, and Footer.

### src/pages

Page components representing different routes in the application.

### src/services

Service files for handling API requests and business logic.

### src/utils

Utility functions and constants.

## Example Code Snippets

### Custom Hook: useFetch

\`\`\`jsx
import { useState, useEffect } from 'react';

const useFetch = (url) => {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await fetch(url);
                const result = await response.json();
                setData(result);
            } catch (err) {
                setError(err);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [url]);

    return { data, loading, error };
};

export default useFetch;
\`\`\`

### Context Provider: AuthContext

\`\`\`jsx
import React, { createContext, useState } from 'react';

export const AuthContext = createContext();

const AuthProvider = ({ children }) => {
    const [isAuthenticated, setIsAuthenticated] = useState(false);

    const login = () => setIsAuthenticated(true);
    const logout = () => setIsAuthenticated(false);

    return (
        <AuthContext.Provider value={{ isAuthenticated, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
};

export default AuthProvider;
\`\`\`

## More Details

Each folder and file has been designed to serve a specific purpose in the application. Refer to the example snippets above for common usage patterns.

" > src/ReadMeMan/README.md

echo -e "\e[1;32mHappY CodinG\e[0m"
echo -e "\e[1;34mMade bY MaThanMiThun\e[0m"

# Start the development server
npm run dev 