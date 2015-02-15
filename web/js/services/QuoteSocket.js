import QuoteServerActions from '../actions/QuoteServerActions'

export default {

  channel: null,

  join() {
    new Phoenix.Socket("/ws").join("stockquotes", {}, channel => {
      this.channel = channel

      channel.on("update:quote", msg => {
        QuoteServerActions.updateQuote(msg.quote)
      })
    })
  },

  addQuote() {
    this.channel && this.channel.send("add:quote", {})
  }
}
