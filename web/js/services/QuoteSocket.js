import QuoteActions from '../actions/QuoteActions'

export default {

  channel: null,

  join() {
    new Phoenix.Socket("/ws").join("stockquotes", {}, channel => {
      this.channel = channel

      channel.on("update:quote", msg => {
        QuoteActions.updateQuote(msg.quote)
      })
    })
  },

  addQuote() {
    this.channel && this.channel.send("add:quote", {})
  }
}
