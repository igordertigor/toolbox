# toolbox.ingofruend.net

One day, the built-in calculator app of my mobile phone asked me for data access permissions. A calculator shouldn't need to collect data. Nor should a unit converter and probably a number of other simple tools.

This repository is a collection of tools that I would like to have available in my browser be definitely without any tracking, data collection or server access (beyond loading the actual app).

At the moment, there are two tools:
- A simple calculator that honours parentheses.
- A unit converter for celsius/fahrenheit and meter/feet. If you need more units, feel free to open an issue.

## Adding features

Add features to your project with `sv add`:

```sh
pnpm dlx sv add
```

For example, to add Tailwind CSS:

```sh
pnpm dlx sv add tailwindcss
```

## Developing

Once you've created a project and installed dependencies with `pnpm install`, start a development server:

```sh
pnpm run dev

# or start the server and open the app in a new browser tab
pnpm run dev -- --open
```

## Building

To create a production version of your app:

```sh
pnpm run build
```

You can preview the production build with `pnpm run preview`.

## Deploy

```sh
bash deploy.sh
```
