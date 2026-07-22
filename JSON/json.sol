// ============================================================
// SOL Native Standard Library -- JSON Module
// ============================================================

// --- Serialize SOL types to JSON string ---
fun stringify(val: any): string
    imm val_type: string -> type.of(val)

    if (val_type == "string")
        ret "\"" + val + "\""
    elseif (val_type == "integer" || val_type == "float")
        ret type.toString(val)
    elseif (val_type == "boolean")
        if (val)
            ret "true"
        end
        ret "false"
    elseif (val_type == "list")
        nonimm out: string -> "["
        nonimm i: integer -> 0
        imm count: integer -> list.len(val)

        while (i < count)
            out -> out + stringify(val[i])
            if (i < count - 1)
                out -> out + ", "
            end
            i -> i + 1
        end

        ret out + "]"
    elseif (val_type == "map")
        nonimm out: string -> "{"
        imm keys: list -> map.keys(val)
        nonimm i: integer -> 0
        imm count: integer -> list.len(keys)

        while (i < count)
            imm k: string -> keys[i]
            out -> out + "\"" + k + "\": " + stringify(val[k])
            if (i < count - 1)
                out -> out + ", "
            end
            i -> i + 1
        end

        ret out + "}"
    end

    ret "null"
end
