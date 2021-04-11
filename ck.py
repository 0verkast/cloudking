import awscli as a
import gcloud  as g
import azure as az
from os import sys

class Command:
    def __init__(self,provider="",resource="",function="",resource_name="",profile=""):
        self.provider=provider
        self.resource=resource
        self.function=function
        self.resource_name=resource_name
        self.profile=profile

    def parse_command(self):
        for i in range(len(sys.argv)):
            print(sys.argv[i])

            



def print_banner():
    print(
    """
 ▄████▄   ██▓     ▒█████   █    ██ ▓█████▄     ██ ▄█▀ ██▓ ███▄    █   ▄████ 
▒██▀ ▀█  ▓██▒    ▒██▒  ██▒ ██  ▓██▒▒██▀ ██▌    ██▄█▒ ▓██▒ ██ ▀█   █  ██▒ ▀█ 
▒▓█    ▄ ▒██░    ▒██░  ██▒▓██  ▒██░░██   █▌   ▓███▄░ ▒██▒▓██  ▀█ ██▒▒██░▄▄▄░
▒▓▓▄ ▄██▒▒██░    ▒██   ██░▓▓█  ░██░░▓█▄   ▌   ▓██ █▄ ░██░▓██▒  ▐▌██▒░▓█  ██▓
  ▓███▀ ░░██████▒░ ████▓▒░▒▒█████▓  ▒████▓    ▒██▒ █▄░██░▒██░   ▓██░░▒▓███▀ 
    """)
    return

def main():
    if any(x in sys.argv for x in ["--help","-h","help","h"]) and not any(x in sys.argv for x in ["aws","gcloud","azure"]):
        print_banner()

    if any(x in sys.argv for x in ["aws","gcloud","azure"]):
        
        command = Command()
        command.parse_command()

    else:
        print("Not much I can do with that, sorry")
        return


if __name__ == "__main__":
    main()


