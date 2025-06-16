def main(**kwargs):
    result = kwargs.get("userid", None)
    
    if result is not None:
        print(f"User ID: {result}")
    
    print("User ID not provided")

main(userid=None)