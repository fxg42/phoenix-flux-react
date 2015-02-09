import "6to5ify/polyfill"
import React from 'react'
import Application from './components/Application.react'
import QuoteSocket from './services/QuoteSocket'

React.render (
  <Application />,
  document.getElementById('app-container')
)

QuoteSocket.join()
