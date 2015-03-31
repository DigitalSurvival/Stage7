#!/usr/bin/env python

# This program is one of the GUIs for the Stage7 installer.
# Written by Matthew Marchese

import tkinter as tk


class Application(tk.Frame):
    def __init__(self, master=None):
        tk.Frame.__init__(self, master)
        self.grid()
        self.createWidgets()

    def createWidgets(self):
        self.quitButton = tk.Button(self, text='Exit', command=self.quit)
        self.quitButton.grid(row=0, column=0, sticky=tk.SE)

app = Application()
app.master.title('Stage7 Installer')
app.mainloop()

