from loguru import logger

from python_template.settings import app_settings


def main() -> int:
    logger.info(
        "Hello from python-template! sample_variable={value}",
        value=app_settings.MY_SAMPLE_VARIABLE,
    )
    return 0
