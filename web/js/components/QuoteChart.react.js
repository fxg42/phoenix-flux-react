import React from 'react'
import Chartist from 'chartist'

export default class QuoteChart extends React.Component {

  componentWillReceiveProps(props) {
    return this.updateChart(props)
  }

  componentDidMount() {
    return this.updateChart(this.props)
  }

  updateChart(props) {
    let quotes = this.props.data.quotes
      .toList()
      .sortBy(q => q.name)
    let chartData = {
      labels: quotes.map(q => q.get('name')).toJS(),
      series: [ quotes.map(q => q.get('value')).toJS() ]
    }
    let chartOptions = {
      low: 0,
      high: 1000
    }
    return new Chartist['Bar'](React.findDOMNode(this), chartData, chartOptions, {})
  }

  render() {
    return <div className='ct-chart'></div>
  }
}
