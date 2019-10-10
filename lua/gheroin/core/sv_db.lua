-- Just Database stuff for storing the NPC Positions.

function gHeroin.DB.StatupChecks()
    if(!sql.TableExists("gheroin_npcpos")) then
        sql.Query("CREATE TABLE gheroin_npcpos(id INTEGER PRIMARY KEY AUTOINCREMENT, pos VARCHAR(255), ang VARCHAR(255))")
    end
end

function gHeroin.DB.GetNPCPos(id)
    return sql.Query(string.format("SELECT * FROM gheroin_npcpos WHERE id = %s", id))
end

function gHeroin.DB.GetAllNPCPos()
    return sql.Query("SELECT * FROM gheroin_npcpos")
end

function gHeroin.DB.AddNPC(pos, ang)
    local posTable = {x = pos.x, y = pos.y, z = pos.z}
    local angTable = {p = ang.p, y = ang.y, r = ang.r}
    local posJson = util.TableToJSON(posTable)
    local angJson = util.TableToJSON(angTable)

    sql.Query(string.format("INSERT INTO gheroin_npcpos(pos, ang) VALUES(%s, %s)", sql.SQLStr(posJson), sql.SQLStr(angJson)))
    return sql.Query(string.format("SELECT id FROM gheroin_npcpos WHERE pos = %s AND ang = %s", sql.SQLStr(posJson), sql.SQLStr(angJson)))[1].id
end

function gHeroin.DB.RemoveNPC(id)
    sql.Query(string.format("DELETE FROM gheroin_npcpos WHERE id = %s", id))
end