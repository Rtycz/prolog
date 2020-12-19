# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'mainMenu.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import Qt, QSize
from PyQt5.QtGui import QFont, QImage, QPalette, QBrush, QPixmap, QIcon, QPainter
from PyQt5.QtWidgets import QDesktopWidget, QAbstractButton


#Кастомная кнопка
class PicButton(QAbstractButton):
    def __init__(self, pixmap, pixmap_hover, pixmap_pressed, parent=None):
        super(PicButton, self).__init__(parent)
        self.pixmap = pixmap
        self.pixmap_hover = pixmap_hover
        self.pixmap_pressed = pixmap_pressed

        self.pressed.connect(self.update)
        self.released.connect(self.update)
        self.toggled.connect(self.update)


    def paintEvent(self, event):
        pix = self.pixmap_hover if self.underMouse() else self.pixmap
        if self.isDown():
            pix = self.pixmap_pressed
        if self.isEnabled() == 0:
            pix = self.pixmap_pressed

        painter = QPainter(self)
        painter.drawPixmap(event.rect(), pix)

    def enterEvent(self, event):
        self.update()

    def leaveEvent(self, event):
        self.update()

    def sizeHint(self):
        return QSize(150, 150)

    def changePicPressed(self, pic):
        self.pixmap_pressed = pic
        self.update()

    def changePicNormal(self,pic):
        self.pixmap = pic
        self.update()




class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(505, 800)


        MainWindow.setWindowTitle("Аккинатор про животных!!!")

        self.setWindowIcon(QIcon(r'pics_for_ind_789\icon.png'))


        self.center()

        self.mainMenuWidget = QtWidgets.QWidget(MainWindow)
        self.mainMenuWidget.setObjectName("mainMenuWidget")

        # --------------- фон
        backgroundImage = QImage(r'pics_for_ind_789\background.png')
        self.pallete = QPalette()
        self.pallete.setBrush(QPalette.Window, QBrush(backgroundImage))
        self.setPalette(self.pallete)
        # ------------------------

        #--------- Шрифт
        self.font = QtGui.QFont()
        self.font.setFamily("Post Pixel-7")
        self.font.setPointSize(12)
        self.font.setBold(True)

        self.font1 = QtGui.QFont()
        self.font1.setFamily("Post Pixel-7")
        self.font1.setPointSize(10)
        #------------------------


        self.gridLayout_2 = QtWidgets.QGridLayout(self.mainMenuWidget)
        self.gridLayout_2.setObjectName("gridLayout_2")

        self.label = QtWidgets.QLabel(self.mainMenuWidget)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.label.setStyleSheet("color: rgb(211, 99, 143);")
        self.label.setFont(self.font)
        self.label.setMinimumHeight(50)
        self.label.setMaximumHeight(50)
        self.gridLayout_2.addWidget(self.label, 0, 0, 1, 3)
        self.label.hide()

        #--------- Картинка
        self.image = QtWidgets.QLabel(self.mainMenuWidget)
        self.image.setObjectName("image")
        self.gridLayout_2.addWidget(self.image, 1, 0, 1, 3)
        #------------------------

        #--------- кнопка старт
        self.startButton = PicButton(QPixmap(r'pics_for_ind_789\_startb.png'), QPixmap(r'pics_for_ind_789\_start_hover.png'), QPixmap(r'pics_for_ind_789\_start_pressed.png'))
        self.startButton.setObjectName("Старт")
        self.startButton.setFont(self.font)
        self.startButton.setFixedSize(150, 150)
        self.gridLayout_2.addWidget(self.startButton, 3, 0, 1, 0)

        #self.gridLayout_2.setAlignment(Qt.AlignCenter)

        #------------------------

        #--------- кнопка выход
        self.exitButton = PicButton(QPixmap(r'pics_for_ind_789\_exit.png'),
                                     QPixmap(r'pics_for_ind_789\_exit_hover.png'),
                                     QPixmap(r'pics_for_ind_789\_exit_pressed.png'))
        self.exitButton.setFixedSize(150, 150)

        self.exitButton.setObjectName("Выход")
        self.exitButton.setFont(self.font)



        self.gridLayout_2.addWidget(self.exitButton, 3, 2, 1, 2)
        #------------------------
		
		#--------- Чекбоксы
        self.checkBoxes = []
        self.questionWidget = QtWidgets.QWidget(MainWindow)
        self.questionWidget.setObjectName("questionWidget")



        self.gridLayout_3 = QtWidgets.QGridLayout(self.questionWidget)
        self.gridLayout_3.setObjectName("gridLayout_3")

        for i in range(5):
            self.checkBoxes.append(QtWidgets.QCheckBox(self.questionWidget))
            self.checkBoxes[i].setObjectName("checkBox_{0}".format(i))
            self.checkBoxes[i].setAutoExclusive(True)
            self.checkBoxes[i].setStyleSheet("QCheckBox{ color: rgb(211, 99, 143);}"
                                             "QCheckBox::indicator { width: 40px; height: 40px;}"
                                             "QCheckBox::indicator:unchecked { image: url(pics_for_ind_789/_cb_unchecked.png);}"
                                             "QCheckBox::indicator:unchecked:hover { image: url(pics_for_ind_789/_cb_unchecked_hover.png);}"
                                             "QCheckBox::indicator:unchecked:pressed { image: url(pics_for_ind_789/_cb_unchecked_pressed.png);}"
                                             "QCheckBox::indicator:checked { image: url(pics_for_ind_789/_cb_checked.png);}"
                                             "QCheckBox::indicator:checked:hover { image: url(pics_for_ind_789/_cb_checked_hover.png);}"
                                             "QCheckBox::indicator:checked:pressed { image: url(pics_for_ind_789/_cb_checked_pressed.png);}"
                                             )
            self.checkBoxes[i].setFont(self.font)

        self.checkBoxes[4].hide()

        self.gridLayout_3.addWidget(self.checkBoxes[0], 0, 0, 1, 1)
        self.gridLayout_3.addWidget(self.checkBoxes[1], 1, 0, 1, 1)
        self.gridLayout_3.addWidget(self.checkBoxes[2], 0, 3, 1, 1)
        self.gridLayout_3.addWidget(self.checkBoxes[3], 1, 3, 1, 1)
        self.gridLayout_3.setSpacing(20)

        self.gridLayout_2.addWidget(self.questionWidget, 2, 0, 1, 3)
        self.questionWidget.hide()
        #------------------------

        #----------------------- Виджет для заполнения новой инфы о животном!
        self.newInfoWidget = QtWidgets.QWidget(MainWindow)
        self.newInfoWidget.setObjectName("newINfoWidget")

        self.gridLayout_4 = QtWidgets.QGridLayout(self.newInfoWidget)
        self.gridLayout_4.setObjectName("gridLayout_4")

        self.infoLabel = QtWidgets.QLabel(self.newInfoWidget)
        self.infoLabel.setFont(self.font)
        self.infoLabel.setStyleSheet("color: rgb(211, 99, 143);")
        self.infoLabel.setText("Но вы можете помочь нам узнать его! \n Заполните форму!")

        self.infoLabel.setAlignment(Qt.AlignCenter)
        self.gridLayout_4.addWidget(self.infoLabel, 1, 0, 1, 3)

        self.nameLabel = QtWidgets.QLabel(self.newInfoWidget)
        self.nameLabel.setFont(self.font1)
        self.nameLabel.setStyleSheet("color: rgb(211, 99, 143);")
        self.nameLabel.setText("Название животного: ")
        self.nameLabel.setMaximumHeight(20)
        self.gridLayout_4.addWidget(self.nameLabel, 2, 0)

        self.nameEdit = QtWidgets.QLineEdit(self.newInfoWidget)
        self.nameEdit.setFont(self.font1)
        self.nameEdit.setMaximumHeight(50)
        self.nameEdit.setStyleSheet("QLineEdit { border-style: outset;"
                                    "            border-width: 2px;"
                                    "            border-color: rgb(211, 99, 143);"
                                    "            border-radius: 10px;"
                                    "            color: rgb(211, 99, 143);"
                                    "            padding: 0 10px;"
                                    "            background: rgb(255, 227, 239);"
                                    "            selection-background-color: darkgray;}")
        self.gridLayout_4.addWidget(self.nameEdit, 2, 1, 1, 1)



        self.pictureLabel = QtWidgets.QLabel(self.newInfoWidget)
        self.pictureLabel.setFont(self.font1)
        self.pictureLabel.setText("изображение животного: ")
        self.pictureLabel.setMaximumHeight(20)
        self.pictureLabel.setStyleSheet("color: rgb(211, 99, 143);")
        self.gridLayout_4.addWidget(self.pictureLabel, 3, 0)


        self.pictureButton = PicButton(QPixmap(r'pics_for_ind_789\_pick.png'),
                                       QPixmap(r'pics_for_ind_789\_pick_hover.png'),
                                       QPixmap(r'pics_for_ind_789\_pick_pressed.png'))
        self.pictureButton.setFixedSize(100, 100)
        self.pictureButton.setText("Выбрать")
        self.gridLayout_4.addWidget(self.pictureButton, 3, 1, 1, 1)



        self.learnNewButton = PicButton(QPixmap(r'pics_for_ind_789\_add.png'),
                                    QPixmap(r'pics_for_ind_789\_add_hover.png'),
                                    QPixmap(r'pics_for_ind_789\_add_pressed.png'))
        self.learnNewButton.setFixedSize(100, 100)

        self.learnNewButton.setEnabled(0)
        self.learnNewButton.setText("Запомнить животное!")
        self.gridLayout_4.addWidget(self.learnNewButton, 3, 2, 1, 1)

        self.gridLayout_4.setSpacing(5)

        self.gridLayout_2.addWidget(self.newInfoWidget, 2, 0, 1, 3)

        self.newInfoWidget.hide()

        # ------------------------
		
		#--------- кнопки, на которые потом будем заменять исходные
        self.backButton = PicButton(QPixmap(r'pics_for_ind_789\_back.png'),
                                    QPixmap(r'pics_for_ind_789\_back_hover.png'),
                                    QPixmap(r'pics_for_ind_789\_back_pressed.png'))
        self.backButton.setFixedSize(150, 150)

        self.backButton.setObjectName("Назад")
        self.gridLayout_2.addWidget(self.backButton, 3, 2, 1, 1)
        self.backButton.hide()

        self.resultButton = PicButton(QPixmap(r'pics_for_ind_789\_result.png'),
                                    QPixmap(r'pics_for_ind_789\_result_hover.png'),
                                    QPixmap(r'pics_for_ind_789\_result_pressed.png'))
        self.resultButton.setFixedSize(150, 150)
        self.gridLayout_2.addWidget(self.resultButton, 3, 0, 1, 1)
        self.resultButton.hide()

        #self.nextButton = QtWidgets.QPushButton(self.mainMenuWidget)
        self.nextButton = PicButton(QPixmap(r'pics_for_ind_789\_next.png'),
                                      QPixmap(r'pics_for_ind_789\_next_hover.png'),
                                      QPixmap(r'pics_for_ind_789\_next_pressed.png'))
        self.nextButton.setFixedSize(150, 150)
        self.nextButton.setObjectName("Next")
        self.nextButton.setText("След вопрос")

        self.gridLayout_2.addWidget(self.nextButton, 3, 0, 1, 1)
        self.nextButton.hide()

        # ------------------------


        # ------------------- картинки
        self.startPicture = r'pics_for_ind_789\start.png'
        self.unkPicture = r'pics_for_ind_789//unknown.png'

        self.question1Picture = r'pics_for_ind_789\1st_quest.png'
        self.question2Picture = r'pics_for_ind_789\2nd_quest.png'
        self.question3Picture = r'pics_for_ind_789\3rd_quest.png'
        self.question4Picture = r'pics_for_ind_789\4rth_quest.png'
        self.question5Picture = r'pics_for_ind_789\5th_quest.png'
        self.question6Picture = r'pics_for_ind_789\6th_quest.png'
        self.question7Picture = r'pics_for_ind_789\7th_quest.png'
        self.question8Picture = r'pics_for_ind_789\8th_quest.png'

        self.pixmapStart = QPixmap(self.startPicture)
        self.image.setPixmap(self.pixmapStart)

        self.pixmapUnk = QPixmap(self.unkPicture)
        self.pixmapQuest1 = QPixmap(self.question1Picture)
        self.pixmapQuest2 = QPixmap(self.question2Picture)
        self.pixmapQuest3 = QPixmap(self.question3Picture)
        self.pixmapQuest4 = QPixmap(self.question4Picture)
        self.pixmapQuest5 = QPixmap(self.question5Picture)
        self.pixmapQuest6 = QPixmap(self.question6Picture)
        self.pixmapQuest7 = QPixmap(self.question7Picture)
        self.pixmapQuest8 = QPixmap(self.question8Picture)

        self.image.setAlignment(Qt.AlignCenter)
        # -------------------

        self.gridLayout_2.setSpacing(1)

        self.mainMenuWidget.setFixedSize(515,800)
        MainWindow.setCentralWidget(self.mainMenuWidget)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)


    def center(self):
        qr = self.frameGeometry()
        cp = QDesktopWidget().availableGeometry().center()
        qr.moveCenter(cp)
        self.move(qr.topLeft())

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "Аккинатор про животных!!! "))
        self.label.setText(_translate("MainWindow", "TextLabel"))
        self.startButton.setText(_translate("MainWindow", "Начать!"))
        self.exitButton.setText(_translate("MainWindow", "Выйти..."))
