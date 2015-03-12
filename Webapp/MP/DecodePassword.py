import base64
import binascii 

encoded_password = "X03MO1qnZdYdgyfeuILPmQ=="
decoded_password = base64.b64decode(encoded_password)
decoded_password = binascii.hexlify(decoded_password)

print decoded_password
