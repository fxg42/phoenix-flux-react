import React from 'react'
import Quote from './Quote.react'
import ImmutableRenderMixin from 'react-immutable-render-mixin'

export default class QuoteList extends React.Component {
  mixins: [ ImmutableRenderMixin ]

  render() {
    let quotes = this.props.data.quotes
      .toList()
      .sortBy(q => q.get('value'))
      .map(q => <Quote key={q.get('name')} name={q.get('name')} value={q.get('value')}/>)
    return <ul style={{textAlign: 'left'}}>{quotes}</ul>
  }
}
