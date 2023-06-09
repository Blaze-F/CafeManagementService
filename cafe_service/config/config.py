import os

import yaml


yaml_settings = dict()
path = os.path.abspath(os.path.dirname(__file__))
filename = "config.yml"

with open(os.path.join(path, filename)) as f:
    yaml_settings.update(yaml.load(f, Loader=yaml.FullLoader))


class Config:
    databases: dict = yaml_settings["databases"]
    secrets: dict = yaml_settings["secrets"]
    token: dict = yaml_settings["token"]
    page_size: dict = yaml_settings["page_size"]


config = Config()
