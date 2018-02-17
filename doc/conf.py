project = u'Miruken'
copyright = u'2017, Miruken'
author = u'Craig Neuwirt, Michael Dudley'

extensions = []
sourcesuffix = '.rst'
master_doc = 'index'
version = u''
release = u''
exclude_patterns = ['**/README.rst']
pygments_style = 'sphinx'

html_theme = "sphinx_rtd_theme"
html_theme_path = ["_themes", ]
html_theme_options = {
    'display_version': True,
    'prev_next_buttons_location': 'both',
    # Toc options
    'collapse_navigation': False,
    'sticky_navigation': True
}

todo_include_todos = False
htmlhelp_basename = 'Miruken'

latex_elements = {
}

latex_documents = [
    (master_doc, 'Miruken.tex', u'Miruken Documentation',
     u'Michael Dudley', 'manual'),
]

man_pages = [
    (master_doc, 'miruken', u'Miruken Documentation',
     [author], 1)
]

texinfo_documents = [
    (master_doc, 'Miruken', u'Miruken Documentation',
     author, 'Miruken', 'One line description of project.',
     'Miscellaneous'),
]