
def handler(event, context):
    name = event.get("name", "World")

    return {
        "statusCode": 200,
        "body": f"Hello {name}, Welcome to Kamal Serverless! Now deployed from GitHub Actions!"
    }
