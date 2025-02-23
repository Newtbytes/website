import markdown


extensions = ["md_in_html"]


def convert(source: str):
    return markdown.markdown(source, extensions=extensions)
