# Add more folders to ship with the application, here

TARGET = harbour-qml2048

CONFIG += sailfishapp_qml

DISTFILES += \
    qml/cover/CoverPage.qml \
    qml/harbour-qml2048.qml \
    qml/pages/ScoreArea.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/SwipeArea.qml \
    qml/pages/Cell.qml \
    qml/pages/About.qml \
    qml/pages/Board.qml \
    qml/pages/Tile.qml \
    qml/pages/MainPage.qml \
    qml/pages/ScoreItem.qml \
    qml/pages/LosePage.qml \
    qml/pages/FadeText.qml \
    qml/pages/board.js \
    qml/pages/scoreitem.js \
    qml/pages/speed.js \
    qml/pages/storage.js \
    qml/pages/tile.js \
    harbour-qml2048.desktop \
    rpm/harbour-2048.changes \
    rpm/harbour-qml2048.yaml

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172
