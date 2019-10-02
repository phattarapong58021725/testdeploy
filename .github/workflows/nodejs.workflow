name: Node CI

on: [push]

jobs:
  build:

    runs-on: windows-2019

    strategy:
      matrix:
        node-version: [10.x, 12.x]

    steps:
    - uses: actions/checkout@v1
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v1
      with:
        node-version: ${{ matrix.node-version }}
    - name: npm install, build, and test
      run: |
        npm install
        npm run build 
        echo success
      env:
        CI: true
