from calendar import HTMLCalendar
import datetime


def get_booked_days(sdate, edate):
    sd = datetime.datetime.strptime(str(sdate), "%Y-%m-%d")
    ed = datetime.datetime.strptime(str(edate), "%Y-%m-%d")
    m = []
    ind = 1
    for x in range((ed - sd).days + 1):
        m.append({'date': (sd + datetime.timedelta(days=x)).strftime("%d/%m/%Y"), 'id': ind})
        ind += 1
    return m
    # return [(sd + datetime.timedelta(days=x)).strftime("%d/%m/%Y") for x in range((ed - sd).days + 1)]


# class Calendar(HTMLCalendar):
#     def __init__(self, year=None, month=None, booked_days=[]):
#         self.year = year
#         self.month = month
#         self.booked_days = booked_days
#         super(Calendar, self).__init__()
#     def formatday(self, day, booked_days):
#         if day != 0:
#             if day in booked_days:
#                 if day == int(datetime.date.today().day):
#                     return f"<td class='cal_cell booked today'>{day}</td>"
#                 else:
#                     return f"<td class='cal_cell booked'>{day}</td>"
#             else:
#                 if day == int(datetime.date.today().day):
#                     return f"<td class='cal_cell today'>{day}</td>"
#                 else:
#                     return f"<td class='cal_cell'>{day}</td>"
#         return '<td></td>'
#     def formatweek(self, theweek, booked_days):
#         week = ''
#         for d, weekday in theweek:
#             week += self.formatday(d, booked_days)
#         return f'<tr> {week} </tr>'
#     def formatmonth(self, withyear=True):
#         # events = Event.objects.filter(start_time__year=self.year, start_time__month=self.month)
#         cal = f'<table border="0" cellpadding="0" cellspacing="0"     class="calendar">\n'
#         cal += f'{self.formatmonthname(self.year, self.month, withyear=withyear)}\n'
#         cal += f'{self.formatweekheader()}\n'
#         for week in self.monthdays2calendar(self.year, self.month):
#             cal += f'{self.formatweek(week, self.booked_days)}\n'
#         return cal