import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

PASSWORD_KEY = os.getenv("PASSWORD_KEY")