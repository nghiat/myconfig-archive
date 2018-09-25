import os

colors256 = {
    # Light
    "tLB": "15", "LB": "#ffffff",
    "tLF": "0", "LF": "#000000",
    "tLCommentF": "1", "LCommentF": "#800000",
    "tLStringF": "2", "LStringF": "#008000",
    "tLKeywordF": "4", "LKeywordF": "#000080",
    "tLLineNumberF": "4", "LLineNumberF": "#000080",
    "tLSelectionB": "33", "LSelectionB": "#0087ff",
    "tLSelectionF": "15", "LSelectionF": "#ffffff",
    "tLSearchB": "121", "LSearchB": "#87ffaf",
    "tLMatchBracketB": "121", "LMatchBracketB": "#87ffaf",
    "tLCurrentLineB": "254", "LCurrentLineB": "#e4e4e4",
    "tLMaxColumnB": "254", "LMaxColumnB": "#e4e4e4",
    "tLCompletePopupB": "254", "LCompletePopupB": "#e4e4e4",
    "tLCompletePopupF": "0", "LCompletePopupF": "#000000",
    # Dark
    "tDB": "0", "DB": "#000000",
    "tDF": "15", "DF": "#ffffff",
    "tDCommentF": "87", "DCommentF": "#5fffff",
    "tDStringF": "207", "DStringF": "#ff5fff",
    "tDKeywordF": "227", "DKeywordF": "#ffff5f",
    "tDLineNumberF": "4", "DLineNumberF": "#ffff5f",
    "tDSelectionB": "33", "DSelectionB": "#0087ff",
    "tDSelectionF": "15", "DSelectionF": "#000000",
    "tDSearchB": "89", "DSearchB": "#87005f",
    "tDMatchBracketB": "89", "DMatchBracketB": "#87005f",
    "tDCurrentLineB": "238", "DCurrentLineB": "#444444",
    "tDMaxColumnB": "238", "DMaxColumnB": "#444444",
    "tDCompletePopupB": "238", "DCompletePopupB": "#444444",
    "tDCompletePopupF": "15", "DCompletePopupF": "#ffffff",

    # Terminal usually uses color name Black, White, etc.
    # If you want dark theme, D{Color} should be inverted
    # (e.g. DBlack should be light color)
    "LBlack": "#000000",
    "LWhite": "#ffffff",
    "LRed": "#800000",
    "LGreen": "#008000",
    "LBlue": "#000080",
    "LYellow": "#808000",
    "LMagenta": "#800080",
    "LCyan": "#008080",
}


def generate_from_a_template_file(template_file, output_file):
    output_str = ""
    expanded_output = os.path.expanduser(output_file)
    with open(template_file) as f:
        output_str = f.read().format(**colors256)
    with open(expanded_output, "w") as f:
        f.write(output_str)
    print("Generated {0} from {1} with colors code replaced"
          .format(expanded_output, template_file))


def generate_from_template_files(templates_map):
    for template, output_file in templates_map.items():
        if os.path.exists(output_file):
            backup_num = 0
            while True:
                backup_path = output_file + ".backup"
                if backup_num:
                    backup_path += "." + str(backup_num)
                if not os.path.exists(backup_path):
                    break
                backup_num += 1
            os.rename(output_file, backup_path)
            print("{} file exists. Renaming it to {}"
                  .format(output_file, backup_path))
        generate_from_a_template_file(template, output_file)


def delete_generated_files(templates_map):
    for template_file, output_file in templates_map.items():
        expanded_output = os.path.expanduser(output_file)
        if os.path.exists(expanded_output):
            os.remove(expanded_output)
            print("Deleted file {0} that was generated from"
                  .format(expanded_output, template_file))
