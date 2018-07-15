import os

colors256 = {
    "xblack": "0", "black": "#000000", "blackRGB": "0, 0, 0",
    "xmaroon": "1", "maroon": "#800000", "maroonRGB": "128, 0, 0",
    "xgreen": "2", "green": "#008000", "greenRGB": "0, 128, 0",
    "xolive": "3", "olive": "#808000", "oliveRGB": "128, 128, 0",
    "xnavy": "4", "navy": "#000080", "navyRGB": "0, 0, 128",
    "xpurple": "5", "purple": "#800080", "purpleRGB": "128, 0, 128",
    "xteal": "5", "teal": "#008080", "tealRGB": "0, 128, 128",
    "xwhite": "15", "white": "#ffffff", "whiteRGB": "255, 255, 255",
    "xdodgerblue1": "33", "dodgerblue2": "#0087ff", "dodgerblue2RGB": "0, 135, 255",
    "xpalegreen1": "121", "palegreen1": "#87ffaf", "palegreen1RGB": "135, 255, 175",
    "xgrey89": "254", "grey89": "#e4e4e4", "grey89RGB": "228, 228, 228"
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
        if not os.path.exists(output_file):
            generate_from_a_template_file(template, output_file)
        else:
            print('Can\'t generate from template {0}, "{1}" already existed, '
                  .format(template, output_file))


def delete_generated_files(templates_map):
    for template_file, output_file in templates_map.items():
        expanded_output = os.path.expanduser(output_file)
        if os.path.exists(expanded_output):
            os.remove(expanded_output)
            print("Deleted file {0} that was generated from"
                  .format(expanded_output, template_file))
