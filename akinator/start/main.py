# -*- coding: utf-8 -*-

import sys
from PyQt5 import QtWidgets
from PyQt5.QtGui import QPixmap
from transliterate import detect_language

import mainMenu
import pyswip
from pprint import pprint
import transliterate






class ExampleApp(QtWidgets.QMainWindow, mainMenu.Ui_MainWindow):

    def __init__(self):
        # Это здесь нужно для доступа к переменным, методам
        # и т.д. в файле design.py
        super().__init__()
        self.setupUi(self)  # Это нужно для инициализации нашего дизайна
        #кнопка выхода
        self.exitButton.clicked.connect(self.close)

        # ------------------- врубаем консультанта...
        self.akkinator = pyswip.Prolog()
        self.akkinator.consult('ind_72.pl')
        # -------------------

        # файл с записанными пользователями животными
        self.fileDynamicAnimals =[]
        self.readNewStart()

        # картинка для неизвестных штук
        self.newImagePath = ""


        # кол-во плеев
        self.numberOfPLays = 0

        #ответы
        self.answers = [-1, -1, -1, -1, -1, -1, -1, -1]

        #слушатель, который чекает заполненость чекбоксов
        self.checkBoxes[4].stateChanged.connect(self.checkEnabled)

        #слушатель, для нового животного
        self.nameEdit.textChanged[str].connect(self.checkText)



        self.startButton.clicked.connect(lambda: self.startAkkinator(1, 1))

    #Проверяет зажат ли вспомогательный чекбокс
    def checkEnabled(self):
        if self.checkBoxes[4].checkState() == 2:
            self.nextButton.setEnabled(0)
            self.resultButton.setEnabled(0)
        else:
            self.nextButton.setEnabled(1)
            self.resultButton.setEnabled(1)

    def checkText(self):
        if len(self.nameEdit.text()) == 0:

            self.learnNewButton.setEnabled(0)
        else:
            self.learnNewButton.setEnabled(1)

    # Получить ответ на вопрос
    def getAnswer(self, question):
        for i in range(len(self.checkBoxes)-1):
            if self.checkBoxes[i].checkState() == 2:
                self.answers[question] = i

                #ставим чекнутой пустой чекбокс, чтобы было пусто в ячейках
                self.checkBoxes[4].setChecked(True)

                break

    # Если возвращаемся на прошлый вопрос, то ставим галку на отмеченном
    def setAnswer(self, question):
        if self.answers[question] != -1:
            self.checkBoxes[self.answers[question]].setCheckState(2)

    # Если новая игра, то "обнуляем" массив ответов
    def newGame(self):
        for i in range(len(self.answers)):
            self.answers[i] = -1
        if self.nameEdit.text() != "":
            self.nameEdit.setText("")
            self.learnNewButton.changePicPressed(QPixmap(r'pics_for_ind_789\_add_pressed.png'))
            self.pictureButton.changePicNormal(QPixmap(r'pics_for_ind_789\_pick.png'))


    # Открыть диалоговое окно для выбора изображения
    def openImages(self):
        self.newImagePath = QtWidgets.QFileDialog.getOpenFileName(self, "Выберите изображение",
                                                                  filter="Images (*.png *.jpg)")[0]
        print(self.newImagePath)
        self.pictureButton.changePicNormal(QPixmap(r'pics_for_ind_789\_pick_pressed.png'))
        self.pictureButton.disconnect()

    # прочитать из файла динамических чувырл в начале
    def readNewStart(self):
        q = self.akkinator.query('read_new(X, Y)')

        q = list(q)
        pprint(q)

    # прочитать из файла динамических чувырл в процессе
    def readNewCont(self,ru_name, en_name):
        query = "read_new_cont({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, '{0}', ' {9}', ' {10}')".format( en_name, self.answers[0], self.answers[1],
                                                                                                 self.answers[2], self.answers[3], self.answers[4],
                                                                                                 self.answers[5], self.answers[6], self.answers[7],
                                                                                                 str(self.newImagePath), ru_name)
        q = self.akkinator.query(query)
        q = list(q)
        pprint(q)


    # добавить в файл динамических чувырл
    def addNew(self):
        self.fileDynamicAnimals = open('animals.txt', 'a')

        name = self.nameEdit.text()
        lang = detect_language(name)
        eng_name = (transliterate.translit(name, reversed=True))

        if len(self.newImagePath) == 0:
            self.newImagePath = self.unkPicture


        self.fileDynamicAnimals.write("\n "+ eng_name+ "\n")
        for i in self.answers:
            self.fileDynamicAnimals.write(str(i)+".\n")
        self.fileDynamicAnimals.write(" "+self.newImagePath + ";\n")
        self.fileDynamicAnimals.write(" "+name+";")

        self.fileDynamicAnimals.close()

        self.learnNewButton.changePicPressed(QPixmap(r'pics_for_ind_789\_add_pressed1.png'))
        self.readNewCont(name, eng_name)
        self.learnNewButton.disconnect()
        self.learnNewButton.setEnabled(0)

    # Сама игра
    # question - номер вопроса
    # where - ссылка. 1 - вперёд, 0 - назад, 2 - новая игра
    def startAkkinator(self, question, where):

        if question == 1:


            self.image.setPixmap(self.pixmapQuest1)

            self.label.setText("Ваше животное маленькое?")

            # ------- ответики

             #если хотим исправить ответ
            if where == 0 : self.setAnswer(question-1)
            elif where == 2 :
                self.newGame()
                self.label.hide()
                self.newInfoWidget.hide()
            else:
                self.checkBoxes[4].setCheckState(2)

            self.questionWidget.show()

            self.checkBoxes[0].setText("Нет")
            self.checkBoxes[1].setText("Да")
            self.checkBoxes[2].setText("Может быть")
            self.checkBoxes[3].hide()
            # ------------------------

            # ------- кнопоцки
            self.startButton.hide()
            self.nextButton.show()
            self.exitButton.hide()  # убираем кнопку выхода....
            self.backButton.hide()  # убираем на всякий и кнопку назад


            self.nextButton.disconnect()

            self.nextButton.clicked.connect(lambda: self.startAkkinator(question + 1, 1))
            # ------------------------
        elif question == 2:

            self.image.setPixmap(self.pixmapQuest2)
            self.label.setText("Ваше животное домашнее?")

            # ------- ответики

             # если хотим исправить или получить ответ
            if where == 0 : self.setAnswer(question-1)
            else: self.getAnswer(question - 2)
            # ------------------------

            # ------- кнопоцки

            self.backButton.setText("Назад")
            self.backButton.show()

            self.nextButton.disconnect()
            self.nextButton.clicked.connect(lambda: self.startAkkinator(question + 1, 1))
            self.backButton.disconnect()
            self.backButton.clicked.connect(lambda: self.startAkkinator(question - 1, 0))
            # ------------------------
        elif question == 3:
            self.image.setPixmap(self.pixmapQuest3)
            self.label.setText("Ваше животное реальное?")

            # ------- ответики
            self.checkBoxes[3].show()
            self.checkBoxes[3].setText("Было реальным")

             # если хотим исправить или получить ответ
            if where == 0 :self.setAnswer(question - 1)
            else: self.getAnswer(question - 2)
            # ------------------------

            # ------- кнопоцки
            self.nextButton.disconnect()
            self.nextButton.clicked.connect(lambda: self.startAkkinator(question + 1, 1))
            self.backButton.disconnect()
            self.backButton.clicked.connect(lambda: self.startAkkinator(question - 1, 0))
            # ------------------------

        elif question == 4:
            self.label.setText("У вашего животного есть клыки?")
            self.image.setPixmap(self.pixmapQuest4)
            # ------- ответики
            self.checkBoxes[3].hide()

             # если хотим исправить или получить ответ
            if where == 0: self.setAnswer(question - 1)
            else: self.getAnswer(question - 2)
            # ------------------------

            # ------- кнопоцки
            self.nextButton.disconnect()
            self.nextButton.clicked.connect(lambda: self.startAkkinator(question + 1, 1))
            self.backButton.disconnect()
            self.backButton.clicked.connect(lambda: self.startAkkinator(question - 1, 0))
            # ------------------------

        elif question == 5:
            self.label.setText("У вашего животного есть копыта?")
            self.image.setPixmap(self.pixmapQuest5)
            # ------- ответики
            # если хотим исправить или получить ответ
            if where == 0:
                self.setAnswer(question - 1)
                self.checkBoxes[1].setText("Да")
                self.checkBoxes[2].setText("Может быть")

            else: self.getAnswer(question - 2)
            # ------------------------


            # ------- кнопоцки
            self.nextButton.disconnect()
            self.nextButton.clicked.connect(lambda: self.startAkkinator(question + 1, 1))
            self.backButton.disconnect()
            self.backButton.clicked.connect(lambda: self.startAkkinator(question - 1, 0))
            # ------------------------

        elif question == 6:
            self.label.setText("Ваше животное живёт в или возле водоёма?")
            self.image.setPixmap(self.pixmapQuest6)
            # ------- ответики
            self.checkBoxes[1].setText("Возле водоёма")
            self.checkBoxes[2].setText("В водоёме")

             # если хотим исправить или получить ответ
            if where == 0: self.setAnswer(question - 1)
            else: self.getAnswer(question - 2)
            # ------------------------

            # ------- кнопоцки
            self.nextButton.disconnect()
            self.nextButton.clicked.connect(lambda: self.startAkkinator(question + 1, 1))
            self.backButton.disconnect()
            self.backButton.clicked.connect(lambda: self.startAkkinator(question - 1, 0))
            # ------------------------

        elif question == 7:
            self.label.setText("У вашего животного есть крылья?")
            self.image.setPixmap(self.pixmapQuest7)
            # ------- ответики
            self.checkBoxes[1].setText("Да")
            self.checkBoxes[2].setText("Может быть")

             # если хотим исправить или получить ответ
            if where == 0: self.setAnswer(question - 1)
            else: self.getAnswer(question - 2)
            # ------------------------

            # ------- кнопоцки

            self.nextButton.disconnect()
            self.nextButton.clicked.connect(lambda: self.startAkkinator(question + 1, 1))
            self.backButton.disconnect()
            self.backButton.clicked.connect(lambda: self.startAkkinator(question - 1, 0))
            # ------------------------


        elif question == 8:
            self.label.setText("У вашего животного нестандартный набор \n конечностей?")
            self.image.setPixmap(self.pixmapQuest8)
            # ------- ответики
             # если хотим исправить или получить ответ
            if where == 0: self.setAnswer(question - 1)
            else: self.getAnswer(question - 2)
            #------------------------

            # ------- кнопоцки
            self.nextButton.hide()
            self.resultButton.setText("Показать результат")
            self.resultButton.show()

            self.resultButton.disconnect()
            self.resultButton.clicked.connect(lambda: self.seeResults())

            self.backButton.disconnect()
            self.backButton.clicked.connect(lambda: self.startAkkinator(question - 1, 0))
            # ------------------------

    def seeResults(self):
        self.numberOfPLays += 1
        self.label.show()
        self.questionWidget.hide()
        self.backButton.hide()
        self.exitButton.show()

        # кнопка для повторной игры
        self.checkBoxes[4].setCheckState(0)
        self.resultButton.hide()
        self.startButton.show()
        self.startButton.setText("Сыграть ещё!")
        self.startButton.disconnect()
        self.startButton.clicked.connect(lambda: self.startAkkinator(1, 2))

        # ------- ответики
        self.getAnswer(len(self.answers) - 1)

        q = self.akkinator.query('main({0},{1},{2},{3},{4},{5},{6},{7},X, Picture, Name)'.format(self.answers[0], self.answers[1], self.answers[2], self.answers[3], self.answers[4],
                          self.answers[5], self.answers[6], self.answers[7]))
        q = list(q)
        print('----------------------\n Ответ аккинатора: ')
        pprint(q)
        print('----------------------\n')

        # ------------------------
        if q != []:
           s = q[0]['Name'][1:]
           p = q[0]['Picture'][1:]
           pixmap1 = QPixmap(p)
           self.image.setPixmap(pixmap1)



           # -------статистика
           self.label.setText("Это ваша {0} игра!\n Ваше животное {1}".format(self.numberOfPLays, s))

           # ------------------------
        else:
          self.label.setText("Это ваша {0} игра!\n Ваше животное нам неизвестно :(".format(self.numberOfPLays))
          self.newInfoWidget.show()
          self.image.setPixmap(self.pixmapUnk)
          self.pictureButton.clicked.connect(self.openImages)
          self.learnNewButton.clicked.connect(self.addNew)




        print("----------------------\nОтветы пользователя: ",self.answers)
        print('----------------------\n')


def main():
    app = QtWidgets.QApplication(sys.argv)  # Новый экземпляр QApplication
    window = ExampleApp()  # Создаём объект класса ExampleApp
    window.show()  # Показываем окно
    app.exec_()  # и запускаем приложение


if __name__ == '__main__':  # Если мы запускаем файл напрямую, а не импортируем

    main()  # то запускаем функцию main()
