import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

const apiUrl = process.env.REACT_APP_API_URL;
const environment = process.env.REACT_APP_ENVIRONMENT;

class App extends Component {
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
        <p>The API URL is: {apiUrl}</p>
        <p>The environment is: {environment}</p>
      </div>
    );
  }
}

export default App;
