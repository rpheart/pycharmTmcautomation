# -*- coding: utf-8 -*-

from setuptools import setup, find_packages


with open('README.md') as f:
    readme = f.read()

setup(
    name='smartfocus-tmc-automation',
    version='0.1.0',
    description='automation for the UI and API of The Message Cloud',
    long_description=readme,
    author='Moina Farheen, Patrick Summers, Kseniya Domorad',
    packages=find_packages(exclude=('tests', 'docs'))
)
