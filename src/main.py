from argparse import ArgumentParser
# import numpy as np

def say_hello(name: str):
    print(f"Hello {name}")

def main():
    parser = ArgumentParser()
    parser.add_argument("--name", type=str, required=False, default="World")
    args = parser.parse_args()
    say_hello(args.name)

# def print_random_number():
#     random_number = np.random.randint(0, 10)
#     print(random_number)

if __name__ == '__main__':
    main()
