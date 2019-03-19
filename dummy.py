import time
import json
from random import randint


def main(event, context):

    try:

        seconds = randint(2, 5)
        time.sleep(seconds)

        response = {"statusCode": 200,
                    "body": ("Hello world, slept " + str(seconds) + " seconds"),
                    "headers":
                                {
                                "Access-Control-Allow-Headers": "Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
                                "Access-Control-Allow-Methods": "GET,OPTIONS",
                                }
                    }
    except Exception as e:
        response = {"statusCode": 400,
                    "body": json.dumps(e),
                    "headers":
                        {
                            "Access-Control-Allow-Headers": "Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
                            "Access-Control-Allow-Methods": "GET,OPTIONS",
                        }
                    }
    return response
