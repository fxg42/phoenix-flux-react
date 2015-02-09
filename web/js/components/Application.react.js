import React from 'react'
import QuoteList from './QuoteList.react'
import QuoteChart from './QuoteChart.react'
import QuoteStore from '../stores/QuoteStore'
import QuoteViewActions from '../actions/QuoteViewActions'
import ImmutableRenderMixin from 'react-immutable-render-mixin'

export default class Application extends React.Component {
  mixins: [ ImmutableRenderMixin ]

  constructor(props) {
    super(props)
    this.state = { quotes: QuoteStore.getAll() }
  }

  componentDidMount() {
    QuoteStore.addChangeListener(this.onChange.bind(this))
  }

  componentWillUnmount() {
    QuoteStore.removeChangeListener(this.onChange.bind(this))
  }

  onChange() {
    this.setState({ quotes: QuoteStore.getAll() })
  }

  onAddClick() {
    QuoteViewActions.addQuote()
  }

  render() {
    return (
      <div>
        <QuoteChart data={this.state}/>
        <input type="button" value="Add a random quote" onClick={this.onAddClick}/>
        <hr/>
        <QuoteList data={this.state}/>
      </div>
    )
  }
}
