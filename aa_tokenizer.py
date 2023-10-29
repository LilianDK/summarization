import os
from aleph_alpha_client import Client

def aa_tokenizer(token, text):
  client = Client(token=token)
  tokenizer = client.tokenizer("luminous-extended")

  tokens = tokenizer.encode(text)
  and_back_to_text = tokenizer.decode(tokens.ids)

  #print("Tokens:", tokens.ids)
  #print("Back to text from ids:", and_back_to_text)
  return len(tokens.ids)
