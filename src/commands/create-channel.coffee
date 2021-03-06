module.exports.run = (client, message, args) ->

    # Check if there is already a channel
    channel = await message.channel.guild.createChannel("simsimi", 0, {
        topic: """Speak with <@#{client.user.id}> !""",
        nsfw: true,
        rateLimitPerUser: 5
    })
    client.db.set("""serversChannels.#{message.channel.guild.id}""", channel.id)
    .write()

    return client.createMessage message.channel.id,
    """
    Simsimi channel successfully created (<##{channel.id}>)!
    """


module.exports.help = {
    name: "create-channel",
    onlyMod: true
}