# POC Full Stack Java and React Stack

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Step-by-Step Guide](#step-by-step-guide)
- [Usage](#usage)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Overview

A full-stack application using Java with Spring Boot for the backend and React for the frontend, orchestrated by Docker.

## Features

- RESTful API built with Spring Boot
- Interactive UI built with React
- Dockerized services for easy deployment
- Responsive design for improved UX
- Feel free to contribute more!

## Prerequisites

Before starting, ensure you have the following installed:
- Docker
- Java Development Kit (JDK)
- Maven
- Node.js (npm)

### Installation

1. **Set Up Java and Maven:**

   - **Java (JDK):**
     Open a terminal and run:
     ```bash
     sudo apt update
     sudo apt install default-jdk
     ```

   - **Maven:**
     After installing Java, run:
     ```bash
     sudo apt install maven
     ```

2. **Set Up Node.js and npm:**

   - **Node.js (npm):**
     Check if you have `npm` installed by running:
     ```bash
     npm --version
     ```
     If it's not installed, follow instructions on [Node.js](https://nodejs.org/) to install the latest version. I highly recommend [NVM](https://www.freecodecamp.org/news/node-version-manager-nvm-install-guide/).

3. **Set Up Docker:**

   - Follow the [Docker installation guide](https://docs.docker.com/engine/install/ubuntu/) for Ubuntu to install Docker and Docker Compose.

### Project Structure
my-app/
├── backend/
│   ├── src/main/java/com/example/demo/
│   │   ├── Application.java
│   │   └── HelloController.java
│   ├── Dockerfile
│   ├── pom.xml
├── frontend/
│   ├── src/
│   │   └── App.js
│   │   ├── index.js
│   ├── Dockerfile
│   ├── package.json
│   ├── public/
│   │   ├── index.html
└── docker-compose.yml


### Step-by-Step Guide

1. **Backend (Java with Spring Boot):**

   - **Create `Application.java`:**

     ```java
     package com.example.demo;

     import org.springframework.boot.SpringApplication;
     import org.springframework.boot.autoconfigure.SpringBootApplication;
     import org.springframework.web.bind.annotation.GetMapping;
     import org.springframework.web.bind.annotation.RestController;

     @SpringBootApplication
     @RestController
     public class Application {
         public static void main(String[] args) {
             SpringApplication.run(Application.class, args);
         }

         @GetMapping("/api/hello")
         public String sayHello() {
             return "Hello, World!";
         }
     }
     ```

   - **Create `HelloController.java`:**

     This is integrated within `Application.java` above.

   - **Edit `pom.xml`:**

     Ensure it includes:

     ```xml
     <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-web</artifactId>
         <version>2.7.0</version>
     </dependency>
     ```

2. **Frontend (React):**

   - **Create `index.html`:**

     ```html
     <!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>React App</title>
     </head>
     <body>
         <div id="root"></div>
     </body>
     </html>
     ```

   - **Create `index.js`:**

     ```javascript
     import React from 'react';
     import ReactDOM from 'react-dom';
     import App from './App';

     ReactDOM.render(
       <React.StrictMode>
         <App />
       </React.StrictMode>,
       document.getElementById('root')
     );
     ```

   - **Create `App.js`:**

     ```javascript
     import React from 'react';

     function App() {
       return (
         <div>
           <h1>Hello, World!</h1>
         </div>
       );
     }

     export default App;
     ```

   - **Initialize `package.json`:**

     Run in `frontend` directory:

     ```bash
     npm init -y
     npm install react react-dom react-scripts
     ```

3. **Docker Setup:**

   - **`docker-compose.yml`:**

     Ensure it sets up both services:

     ```yaml
     version: '3.8'
     services:
       backend:
         build: ./backend
         ports:
           - "8080:8080"
         networks:
           - my-network

       frontend:
         build: ./frontend
         ports:
           - "3000:3000"
         networks:
           - my-network

     networks:
       my-network:
         driver: bridge
     ```

4. **Run the Application:**

   Use the Makefile commands:

   - Build: `make build`
   - Run: `make run`
   - Clean: `make clean`

5. **Access the Application:**

   - Open your browser and navigate to `http://localhost:3000` for the frontend.
   - The frontend connects to the backend at `http://localhost:8080/api/hello`.


## Usage

To run the application:

1. Build the services:
   ```bash
   make build
   ```
2. Start the application:
   ```bash
   make run
   ```

Access the frontend at `http://localhost:3000`.

## Testing

Verify all dependencies are installed:

```bash
make test
```

## Troubleshooting

- **Issue: Docker fails to build.**
  - Solution: Ensure Docker daemon is running and rebuild with `make build`.

- **Issue: Backend not responding.**
  - Solution: Check logs and verify Spring Boot application is running.

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Push your branch and open a pull request.

## License

This project is licensed under the MIT License.

## Contact

For questions or suggestions, please contact me by:

- Charles Derek
- [\[Email\]](mailto:charlesderek@mrginnovations.com?subject=In%20regards%20to%20the%20POC%20Full%20Stack%20Java%20and%20React%20Stack%20Docker%20application%20I%20found%20on%20Github)
- [\[LinkedIn\]](https://www.linkedin.com/in/charlesderek/)

By following this guide, you should be able to set up and run the application even if you're new to Java and React.
