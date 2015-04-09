import QuoteServerActions from '../actions/QuoteServerActions'

export default {

  channel: null,

  join() {
    var socket = new Phoenix.Socket("/ws")
    socket.connect()

    socket.join("stockquotes", {}).receive("ok", channel => {
      this.channel = channel

      channel.on("update:quote", msg => {
        QuoteServerActions.updateQuote(msg.quote)
      })
    })
  },

  addQuote() {
    this.channel && this.channel.push("add:quote", {})
  }
}
