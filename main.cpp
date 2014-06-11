#include <QtGui/QGuiApplication>
#include <QQuickView>
#include <QtQml>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;
    view.setSource (QUrl("qml/test-components.qml"));
    view.show ();

    return app.exec();
}
