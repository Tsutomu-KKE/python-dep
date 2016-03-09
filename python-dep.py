import graphviz
from subprocess import run, PIPE
ss = run(['pipdeptree'], stderr=PIPE, universal_newlines=True).stderr.rstrip().split('\n')
ss = [s[2:].split()[:3] for s in ss if s[0] in ' *']
g = graphviz.Digraph(format='png', filename='python-dep')
g.edges([(s[0][:s[0].index('=')], s[2]) for s in ss])
g.engine = 'fdp'
g.render()
