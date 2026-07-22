imm ESC: string -> ""

imm RESET: string     -> ESC + "[0m"
imm BOLD: string      -> ESC + "[1m"
imm DIM: string       -> ESC + "[2m"
imm ITALIC: string    -> ESC + "[3m"
imm UNDERLINE: string -> ESC + "[4m"

imm FG_BLACK: string   -> ESC + "[30m"
imm FG_RED: string     -> ESC + "[31m"
imm FG_GREEN: string   -> ESC + "[32m"
imm FG_YELLOW: string  -> ESC + "[33m"
imm FG_BLUE: string    -> ESC + "[34m"
imm FG_MAGENTA: string -> ESC + "[35m"
imm FG_CYAN: string    -> ESC + "[36m"
imm FG_WHITE: string   -> ESC + "[37m"

imm BG_BLACK: string   -> ESC + "[40m"
imm BG_RED: string     -> ESC + "[41m"
imm BG_GREEN: string   -> ESC + "[42m"
imm BG_YELLOW: string  -> ESC + "[43m"
imm BG_BLUE: string    -> ESC + "[44m"
imm BG_MAGENTA: string -> ESC + "[45m"
imm BG_CYAN: string    -> ESC + "[46m"
imm BG_WHITE: string   -> ESC + "[47m"

fun red(text: string): string
    ret FG_RED + text + RESET
end

fun green(text: string): string
    ret FG_GREEN + text + RESET
end

fun yellow(text: string): string
    ret FG_YELLOW + text + RESET
end

fun blue(text: string): string
    ret FG_BLUE + text + RESET
end

fun magenta(text: string): string
    ret FG_MAGENTA + text + RESET
end

fun cyan(text: string): string
    ret FG_CYAN + text + RESET
end

fun bold(text: string): string
    ret BOLD + text + RESET
end

// --- Screen & Cursor Controls ---
fun clear(): string
    ret ESC + "[2J" + ESC + "[H"
end

fun hide_cursor(): string
    ret ESC + "[?25l"
end

fun show_cursor(): string
    ret ESC + "[?25h"
end

// --- UI Components ---
fun progress_bar(current: integer, total: integer, width: integer): string
    if (total <= 0)
        ret "[ ] 0%"
    end

    imm percent: integer -> (current * 100) / total
    imm filled_len: integer -> (current * width) / total

    nonimm bar: string -> ""
    nonimm i: integer -> 0

    while (i < width)
        if (i < filled_len)
            bar -> bar + "█"
        else
            bar -> bar + "░"
        end
        i -> i + 1
    end

    ret "[" + FG_CYAN + bar + RESET + "] " + type.toString(percent) + "%"
end

fun badge(label: string, is_success: boolean): string
    if (is_success)
        ret BG_GREEN + FG_BLACK + " " + label + " " + RESET
    end
    ret BG_RED + FG_WHITE + " " + label + " " + RESET
end
