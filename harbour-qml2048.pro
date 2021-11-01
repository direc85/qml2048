# Add more folders to ship with the application, here

TARGET = harbour-qml2048

CONFIG += sailfishapp_qml

DISTFILES += \
    qml/cover/CoverPage.qml \
    qml/components/AboutLabel.qml \
    qml/components/ScoreArea.qml \
    qml/components/SwipeArea.qml \
    qml/components/Cell.qml \
    qml/components/Board.qml \
    qml/components/ScoreItem.qml \
    qml/components/FadeText.qml \
    qml/pages/AboutPage.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/Tile.qml \
    qml/pages/MainPage.qml \
    qml/pages/LosePage.qml \
    qml/js/tile.js \
    qml/js/board.js \
    qml/js/scoreitem.js \
    qml/js/speed.js \
    qml/js/storage.js \
    qml/harbour-qml2048.qml \
    harbour-qml2048.desktop \
    rpm/harbour-2048.changes \
    rpm/harbour-qml2048.yaml

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172
