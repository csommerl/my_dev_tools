# Install

To install `readline-sync`, run the following command from your directory:

```
npm install readline-sync --save
```

Cf. https://launchschool.com/lessons/64655364/assignments/e3733b97


# Uninstall

I finally got a computer that I could add Windows Subsystem for Linux. While setting everything up, I made a slight error with installing ESLint. Namely, I installed it to the home folder rather than the project folder (using `npm install eslint@7.12.1 eslint-cli babel-eslint --save-dev`). My question is whether I uninstalled it correctly. I did so by running `npm uninstall eslint@7.12.1 eslint-cli babel-eslint` and deleting the `package.json` and `package-lock.json` files in the home directly. Is that the correct way to uninstall ESLint from the home directory?