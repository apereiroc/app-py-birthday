import os
from dotenv import load_dotenv

# load .env file
load_dotenv()


def get_env_var(var: str) -> str:
    """
    Return environment variable or raise a ValueError
    """
    value = os.environ.get(var)
    if not value:
        raise ValueError(f"`{var}` not found. Please check your .env file")
    return value


class Config:
    # validate critical fields
    SECRET_KEY = get_env_var("SECRET_KEY")
    ADMIN_PASSWORD = get_env_var("ADMIN_PASSWORD")
