#include <QDebug>
#include <QCoreApplication>
#include <QThread>

int main(int argc, char** argv)
{
    QCoreApplication app(argc, argv);
    qInfo() << qVersion();
    qInfo() << QCoreApplication::instance()->applicationName();
    qInfo() << QCoreApplication::instance()->applicationVersion();
    qInfo() << QCoreApplication::instance()->applicationDirPath();
    qInfo() << QCoreApplication::instance()->applicationPid();
    qInfo() << QCoreApplication::instance()->objectName();
    qInfo() << QCoreApplication::instance()->organizationDomain();
    qInfo() << QCoreApplication::instance()->organizationName();
    qInfo() << QCoreApplication::instance()->thread()->currentThreadId();

    return app.exec();
}