import AppDispatcher from '../dispatcher/AppDispatcher'
import {EventEmitter} from 'events'
import QuoteConstants from '../constants/QuoteConstants'
import Immutable from 'immutable'

const CHANGE_EVENT = 'change'

class QuoteStore extends EventEmitter {

  constructor() {
    super();
    this.quotes = Immutable.Map()
    this.register()
  }

  register() {
    AppDispatcher.register( action => {
      switch(action.actionType) {
      case QuoteConstants.QUOTE_UPDATE:
        this.update(action.quote)
        this.emitChange()
        break
      default:
        break
      }
    })
  }

  update(quote) {
    this.quotes = this.quotes.set(quote.name, Immutable.Map(quote))
  }

  getAll() {
    return this.quotes
  }

  emitChange() {
    this.emit(CHANGE_EVENT)
  }

  addChangeListener(callback) {
    this.on(CHANGE_EVENT, callback)
  }

  removeChangeListener(callback) {
    this.removeListener(CHANGE_EVENT, callback)
  }
}

export default new QuoteStore()
