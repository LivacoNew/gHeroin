-- Net Messages
util.AddNetworkString("gheroin.core.message")
util.AddNetworkString("gheroin.core.high")

-- Sends a message to the player specified.
function gHeroin.Core.Message(ply, message)
    net.Start("gheroin.core.message")
    net.WriteString(message)
    net.Send(ply)
end
