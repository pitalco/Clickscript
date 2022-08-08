# Clickscript

Clickscript (currently a work in progress) is a new, general purpose, visual programming language that allows no-coders to build software right along with software engineers that code.

Clickscript produces high grade, easy to follow code in various languages (starting with Python then NodeJS) allowing developers to pick up right where no-coders left off and vice-versa.

## Roadmap
- v0: Build and run Clickscript scripts using the Clickscript visual programming language
- v1: Compile Clickscript scripts into Python and/or NodeJS
- v2: Bring legacy .py and .js files into Clickscript so you can build right along legacy code

## Get Started

### Dev
```bash
npm install

npm run dev
```

### Build and Preview
```bash
npm build

npm run preview
```

## Compiler CLI

### Run Local Clickscript JSON File
```julia
julia ./src/clickscript.jl ./code.json
```

### CLI Helper
```julia
julia ./src/clickscript.jl --help
```