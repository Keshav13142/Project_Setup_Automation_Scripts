# Custom script for initial project setup

#### _I'm sure there must be better ways to do this, but I did tried to do this on my own. :)_

<br/>

Create an alias named `init` (or something else) that runs the `script.sh` command in the terminal.

<br/>

# Basic command

```e
$ init type app-name
```

- `init` -> The alias the points to the script.
- `type` -> Type of project
  - React
  - React with node setup
  - Solidjs
  - Solidjs with node setup
  - Svelte
  - And more probably in the future
- `app-name`
  - Only required for `react`, `solid` and `svelte` types, specify `.` or `./` if you want it in the current dir.
  - Other types work in the same directory the script is run in.

<br/>

# Examples

- ```
  $ init react my-app
  ```
  - Creates a react app with the name app `my-app` using `vite`
    Similar for `solid` and `svelte`
- ```
  $ init react-node
  ```
  - Creates a react app using `vite` inside the frontend folder.
  - Creates a backend folder with a `index.js` file (contains some code for initial express setup).
  - Also installs express and dotenv by default.
  - (Similar for `solid-node` as well)

<br/>

### index.js

```js
const express = require("express");
require("dotenv").config();
const PORT = process.env.PORT;
const app = express();

app.use(express.json());

app.get("/", (req, res) => {
  res.json({ message: "API running successfully" });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

<br/>

### This was done to make my development workflow a bit more fluent and reduce the amount of boiler plate code that I write

- You could also install `cors` and `helmet` with the script in your node app if you want to . I might later.... :')
