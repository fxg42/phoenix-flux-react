import React from 'react'
import Quote from './Quote.react'

export default class QuoteList extends React.Component {

  render() {
    return (
      <ul style={{textAlign: 'left'}}>{
        this.props.data.quotes
          .toList()
          .sortBy(q => q.get('value'))
          .map(q =>
            <Quote key={q.get('name')}
                   name={q.get('name')}
                   value={q.get('value')} />)
      }</ul>
    )
  }
}
