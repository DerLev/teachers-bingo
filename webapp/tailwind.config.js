/** @type {import('tailwindcss').Config} */
module.exports = {
  corePlugins: {
    preflight: false
  },
  content: [
    './app/**/*.{js,tx,jsx,tsx,css}',
    './components/**/*.{js,tx,jsx,tsx,css}'
  ],
  important: '#__next',
  theme: {
    extend: {},
  },
  plugins: [],
}
