import random
import time

hotels = list(range(1, 4))

def price():
	for type_ in range(1, 11):
		for hotel in hotels:
			for season in range(1, 5):
				d.append('({0}, {1}, {2}, {3}),'.format(type_, hotel, season, random.randint(500, 2000)))



d = []
def room():
	for hotel in hotels:
		room = 1
		flors = list(range(1, random.randint(1, 4)))
		for floor in flors:
			for _ in range(0, 8):
				type_ = random.randint(1, 10)
				d.append('({0}, {1}, {2}, {3}),'.format(floor, room, type_, hotel))
				room += 1


book1 = ['2021-12-20', '2021-12-01', '2021-11-15', '2021-11-27']
arrival1 = ['2021-12-21', '2021-12-22', '2021-12-18', '2021-12-30']
departure1 = ['2022-01-02', '2022-01-05', '2022-01-07', '2022-01-11']

book2 = ['2021-10-01', '2021-10-05', '2021-10-10', '2021-10-15', '2021-10-17', '2021-10-20']
arrival2 = ['2021-10-21', '2021-10-28', '2021-11-01', '2021-11-09', '2021-11-15']
departure2 = ['2021-11-16', '2021-12-17', '2021-11-18', '2021-11-23', '2021-11-25']


def booking():
	for roomer in range(1, 16):
		departure = random.choice(arrival2)
		d.append('({0}, {1}, "{2}"),'.format(random.randint(1, 13), random.randint(1, 30), departure))


if __name__ == '__main__':
	booking()
	
	[print(i) for i in d]
