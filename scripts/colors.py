import os

colors256 = {
    "xblack": "0", "black": "#000000",
    "xmaroon": "1", "maroon": "#800000",
    "xgreen": "2", "green": "#008000",
    "xnavy": "4", "navy": "#000080",
    "xwhite": "15", "white": "#ffffff",
    "xdodgerblue2": "33", "dodgerblue2": "#0087ff",
    "xpalegreen1": "121", "palegreen1": "#87ffaf",
    "xgrey89": "254", "grey89": "#e4e4e4",
}


def generate_from_a_template_file(template_file, output_file):
    output_str = ""
    with open(template_file) as f:
        output_str = f.read().format(**colors256)
    with open(output_file, "w") as f:
        f.write(output_str)
    print("Generated {0} from {1} with colors code replaced"
          .format(output_file, template_file))


def generate_from_template_files(templates_map):
    for template, output_file in templates_map.items():
        if not os.path.exists(output_file):
            generate_from_a_template_file(template, output_file)
        else:
            print('Can\'t generate from template {0}, "{1}" already existed, '
                  .format(template, output_file))


def delete_generated_files(templates_map):
    for template_file, output_file in templates_map.items():
        if os.path.exists(output_file):
            os.remove(output_file)
            print("Deleted file {0} that was generated from"
                  .format(output_file, template_file))
