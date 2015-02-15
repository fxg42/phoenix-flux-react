import AppDispatcher from '../dispatcher/AppDispatcher'
import QuoteConstants from '../constants/QuoteConstants'

export default {

  updateQuote(quote) {
    AppDispatcher.dispatch({
      actionType: QuoteConstants.QUOTE_UPDATE,
      quote
    })
  }
}

