from setuptools import setup

setup(name='hclust2',
      version='0.99a',
      description='Hclust2 is a handy tool for plotting heat-maps with several useful options to produce high quality figures that can be used in publication.',
      url='https://bitbucket.org/nsegata/hclust2',
      author='Nicola Segata',
      author_email = '',
      scripts = ['hclust2/hclust2.py'],
      packages = ['hclust2'],
      requires=['python (>=2.7)'],
      keywords = ['Bioinformatics']
      )
