// ============================================================
// SOL Native Standard Library -- CSV Module
// ============================================================

// --- Parse CSV text into a List of Lists ---
fun parse(text: string): list
    imm lines: list -> string.split(text, "\n")
    nonimm result: list -> []
    nonimm i: integer -> 0

    while (i < list.len(lines))
        imm line: string -> string.trim(lines[i])
        if (string.len(line) > 0)
            imm raw_row: list -> string.split(line, ",")
            nonimm clean_row: list -> []
            nonimm j: integer -> 0

            while (j < list.len(raw_row))
                list.append(clean_row, string.trim(raw_row[j]))
                j -> j + 1
            end

            list.append(result, clean_row)
        end
        i -> i + 1
    end

    ret result
end

// --- Parse CSV text using the first line as Map keys ---
fun parse_with_header(text: string): list
    imm rows: list -> parse(text)
    if (list.len(rows) <= 1)
        ret []
    end

    imm headers: list -> rows[0]
    nonimm result: list -> []
    nonimm i: integer -> 1

    while (i < list.len(rows))
        imm row: list -> rows[i]
        nonimm entry: map -> {}
        nonimm j: integer -> 0

        while (j < list.len(headers) && j < list.len(row))
            entry[headers[j]] -> row[j]
            j -> j + 1
        end

        list.append(result, entry)
        i -> i + 1
    end

    ret result
end

// --- Serialize a List of Lists back into CSV text ---
fun stringify(rows: list): string
    nonimm output: string -> ""
    nonimm i: integer -> 0

    while (i < list.len(rows))
        imm row: list -> rows[i]
        nonimm line: string -> ""
        nonimm j: integer -> 0

        while (j < list.len(row))
            line -> line + type.toString(row[j])
            if (j < list.len(row) - 1)
                line -> line + ","
            end
            j -> j + 1
        end

        output -> output + line + "\n"
        i -> i + 1
    end

    ret output
end
