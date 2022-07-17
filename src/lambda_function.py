from loader import Loader

LOADER = Loader()

def lambda_handler(event, context):
    LOADER.logger.info("demo function log")