def handler(event, context):
    name = event.get("name", "World")

    return {
        "statusCode": 200,
        "body": f"Hello {name}, Welcome to DevOps Serverless! Now deployed from GitHub Actions!"
    }