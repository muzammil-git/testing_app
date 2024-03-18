from fastapi import FastAPI, HTTPException, Request
from jose import jwt
from datetime import datetime, timedelta
from pydantic import BaseModel, constr, ValidationError
import re
import bcrypt


app = FastAPI()
date = datetime.utcnow()


print(date)

@app.get("/")
async def root():
    date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    token = jwt.encode({'name': 'Muzammil', "date": date}, 'secret', algorithm='HS256')
    res = jwt.decode(token, 'secret', algorithms=['HS256'])


    print(f"Token: {token}")
    # print(datetime)
    return {"messagge": "Hello World"}


# @app.post("/signup")
# async def signup(email: str, password: str):
#     return {"email": email, "password": password}


# Pydantic model for the signup request body
class SignUpRequest(BaseModel):
    email: constr(pattern=r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
    password: constr(min_length=8,)


# Simulated database to store user data
fake_db = []

# Route for handling signup requests
@app.post("/signup")
async def signup(data : SignUpRequest):

    # Get data from the request body
    signup_data = data

    print(signup_data)
    # return {}

    # Check if the email already exists in the database
    for user in fake_db:
        if user["email"] == signup_data.email:
            raise HTTPException(status_code=400, detail="Email already exists")


    # If email is unique, add the user to the database
    password = await hashPassword(signup_data.password)
    fake_db.append({"email": signup_data.email, "password": password})


    print(fake_db)
    return {"message": "User signed up successfully"}

# Route for handling signup requests
@app.post("/login")
async def login(data : SignUpRequest):

    # Get data from the request body
    login_data = data
    print(login_data)
    # return {}

    # Check if the email already exists in the database
    for user in fake_db:
        if user["email"] != login_data.email:
            raise HTTPException(status_code=400, detail="Email doesn't exists in the database")


    # If email is unique, add the user to the database
    password = await matchPassword(login_data.password, fake_db[0]["password"])

    if not password:
        raise HTTPException(status_code=400, detail="Password is incorrect")


    token = makeJWT({"email": login_data.email})
    print(fake_db)    

    return {"message": "User signed in successfully", "token": token}


@app.get("/get_user")
async def get_user(request: Request):
    try:
        token = request.headers['Authorization']
        if not token:
            raise HTTPException(status_code=401, detail="Token is missing")
        token_payload = verifyJWT(token)
        print(token_payload)

        return {"message": "User data fetched successfully", "user": token_payload}

    except KeyError:
        raise HTTPException(status_code=401, detail="Authorization header is missing")
    except jwt.ExpiredSignatureError:
        raise HTTPException(status_code=401, detail="Token has expired")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Internal Server Error {e}")
    


def makeJWT(data: dict):
    # Adding 'exp' claim to the data
    expiration_time = datetime.utcnow() + timedelta(seconds=60)
    # Adding 'exp' claim directly to the data dictionary
    data['exp'] = expiration_time
    token = jwt.encode(data, 'secret', algorithm='HS256' )
    return token

def verifyJWT(token: str):
    token_payload = jwt.decode(token, 'secret', algorithms=['HS256']) 
    expiration_time = token_payload['exp']
    print(f"Expiration time: {expiration_time}")
    
    if expiration_time < datetime.utcnow().timestamp():
        raise HTTPException(status_code=401, detail="Token has expired")
    
    return token_payload

async def hashPassword(password: str):
    hashed_pass_bytes = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
    hashed_pass_str = hashed_pass_bytes.decode('utf-8')
    return hashed_pass_str

async def matchPassword(plain_password: str, hashed_password: str):
    return bcrypt.checkpw(plain_password.encode('utf-8'), hashed_password.encode('utf-8'))